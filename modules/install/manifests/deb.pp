define install::deb (
  $package_name = $title,
  $file         = "${base::userhome}/Downloads/${package_name}.deb",
  $url          = undef,
) {

  # Ensure the file is present, download if needed.
  if !defined(File[$file]) {
    if $url {
      require 'wget'

      wget::fetch { $file:
        destination => $file,
        source      => $url,
        timeout     => 0,
        verbose     => false,
      } -> file { $file: }
    } else {
      exec { "check_existence_$file":
        command => '/bin/true',
        onlyif  => "/usr/bin/test -e $file",
      }
      file { $file:
        require => Exec["check_existence_$file"]
      }
    }
  }

  package { $package_name:
    ensure   => 'latest',
    provider => dpkg,
    source   => $file,
    require  => File[$file],
  }
}

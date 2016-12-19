define install::dpkg(
  String $file,
  String $url = undef,
) {
  require 'wget'

  # Download the dpkg is required.
  if $url != "" {
    wget::fetch { $name:
      destination => $file,
      source      => $url,
      timeout     => 0,
      verbose     => false,
    } -> file { $file: }
  }

  # Installation
  package { $name:
    ensure    => present,
    provider  => dpkg,
    source    => $file,
    require   => File[$file],
  }
}

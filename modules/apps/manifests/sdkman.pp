class apps::sdkman {

  $sdkman_path = "${base::userhome}/.sdkman"

  install::bash { 'https://get.sdkman.io':
    is_url      => true,
    run_as_root => false,
    unless      => "test -d ${sdkman_path}",
    creates     => "${sdkman_path}/bin/sdkman-init.sh",
    env         => [ "SDKMAN_DIR=${sdkman_path}"],
  }

  file { "${base::userhome}/.zshrc":
    ensure => present,
    owner  => $base::user,
  }
  file_line { 'zshrc SDKMAN_DIR':
    path => "${base::userhome}/.zshrc",
    line => "export SDKMAN_DIR=\"${sdkman_path}\"",
  }
  file_line { 'zshrc sdkman-init.sh':
    path => "${base::userhome}/.zshrc",
    line => "[[ -s \"${sdkman_path}/bin/sdkman-init.sh\" ]] && source \"${sdkman_path}/bin/sdkman-init.sh\"",
  }

  define install(
    $package,
    $version = "",
  ) {
    exec { "sdk install ${package} ${version}":
      command => "sdk install ${package} ${version}",
      cwd     => $base::userhome,
      user    => $base::user,
      path    => $::path,
    }
  }
}

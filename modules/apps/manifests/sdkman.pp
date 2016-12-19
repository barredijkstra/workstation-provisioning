class apps::sdkman {
  require base

  class { '::sdkman' :
    owner   => $base::user,
    group   => $base::user,
    homedir => $base::userhome,
  }

  define install(
    String $package = $name,
    String $version = '',
    Boolean $default = true,
  ) {
    sdkman::package { "install ${package} ${version}":
      package_name => $package,
      version      => $version,
      is_default   => $default,
      ensure       => present,
    }
  }

  define remove(
    String $package,
    String $version = '',
  ) {
    sdkman::package { "remove ${package} ${version}":
      package_name => $package,
      version      => $version,
      ensure       => absent,
    }
  }
}

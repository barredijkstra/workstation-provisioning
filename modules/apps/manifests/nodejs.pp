class apps::nodejs(
  String $version,
) {
  class { '::nodejs':
    repo_url_suffix    => $version,
  }

  define global_pkg {
    package { $name:
      ensure   => 'present',
      provider => 'npm',
    }
  }
  define user_pkg (
    String $user = $::base::user,
    String $location
  ){
    nodejs::npm { "$name in $location as user $user":
      ensure  => 'present',
      package => $name,
      target  => $location,
      user    => $user,
    }
  }


}
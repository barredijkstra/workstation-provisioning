class apps::docker (
  Boolean $allow_user_access = true,
  String  $dockercompose_version,
) {
  require base

  class { 'docker':
    version => 'latest',
  }
  class { 'docker::compose':
    ensure => present,
  }

  /*
  if $allow_user_access {
    User <| title == $base::user |> {
      groups +> 'docker',
      require => Class['docker']
    }
  }
  */
}

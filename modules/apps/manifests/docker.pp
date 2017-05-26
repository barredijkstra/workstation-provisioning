class apps::docker (
  Boolean $allow_user_access = true,
  String  $dockercompose_version,
) {
  require base

  ensure_packages([ "docker", "docker-engine-cs", "docker.io", "lxc-docker" ], { ensure => absent })

  install::repo { 'docker':
    repo_location => 'https://download.docker.com/linux/ubuntu',
    repo_release  => 'stable',
    repo_target   => "${lsbdistcodename}",
    repo_key      => {
      id     => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
      source => 'https://download.docker.com/linux/ubuntu/gpg',
    },
  }

  ensure_packages([ "software-properties-common", "linux-image-extra-generic", "linux-image-extra-virtual",  "docker-engine" ], {
    ensure  => 'latest',
    require => Install::Repo['docker']
  })

  /*
  class { '::docker':
    ensure => present,
  }
  class { '::docker::compose':
    ensure => present,
  }

  if $allow_user_access {
    User <| title == $base::user |> {
      groups +> 'docker',
      require => Class['docker']
    }
  }
  */
}

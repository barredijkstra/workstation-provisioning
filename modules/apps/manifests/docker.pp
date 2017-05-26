class apps::docker (
  Boolean $allow_user_access = true,
  String  $dockercompose_version,
) {
  require base

  install::repo { 'docker':
    repo_location => 'https://apt.dockerproject.org/repo',
    repo_release  => 'ubuntu-xenial',
    repo_target   => "main",
    repo_key      => {
      id     => '58118E89F3A912897C070ADBF76221572C52609D',
      server => 'hkp://p80.pool.sks-keyservers.net:80',
    },
  }

  ensure_packages([ "software-properties-common", "linux-image-extra-virtual",  "docker-engine", "docker-compose" ], {
    ensure  => 'latest',
    require => Install::Repo['docker']
  })
}

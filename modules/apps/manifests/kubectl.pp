class apps::kubectl {
  require app::docker

  install::repo { 'kubernetes':
    repo_location => 'http://apt.kubernetes.io/',
    repo_release  => 'kubernetes-xenial',
    repo_target   => 'main',
    repo_key      => {
      source => 'https://packages.cloud.google.com/apt/doc/apt-key.gpg',
    },
  }

  package { 'kubectl':
    ensure  => 'latest',
    require => Install::Repo['kubernetes'],
  }
}
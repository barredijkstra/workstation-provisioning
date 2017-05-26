class apps::kubectl {
  require apps::docker

  install::repo { 'kubernetes':
    repo_location => 'http://apt.kubernetes.io/',
    repo_release  => 'kubernetes-xenial',
    repo_target   => 'main',
    repo_key      => {
      id     => 'D0BC747FD8CAF7117500D6FA3746C208A7317B0F',
      source => 'https://packages.cloud.google.com/apt/doc/apt-key.gpg',
    },
  }

  package { 'kubectl':
    ensure  => 'latest',
    require => Install::Repo['kubernetes'],
  }
}
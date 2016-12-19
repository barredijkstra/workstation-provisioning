class apps::spotify {
  require desktop

  install::repo { 'spotify-client':
    repo_name     => 'spotify',
    repo_location => 'http://repository.spotify.com',
    repo_release  => 'stable',
    repo_target   => 'non-free',
    repo_key      => {
      id     => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
      server => 'hkp://keyserver.ubuntu.com:80',
    },
  }
}

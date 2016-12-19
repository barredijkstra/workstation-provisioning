class apps::vagrant () {
  require base

  package { [ 'virtualbox', 'vagrant' ]:
    ensure => present
  }
}
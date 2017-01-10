class apps::keepass2() {
  require desktop
  require wget

  package { 'keepass2': ensure => installed }


}
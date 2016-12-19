class apps::rambox {
  require desktop

  install::dpkg { 'rambox':
    file  => "${base::userhome}/Downloads/rambox.deb",
    url   => 'https://getrambox.herokuapp.com/download/linux_64?filetype=deb',
  }

}
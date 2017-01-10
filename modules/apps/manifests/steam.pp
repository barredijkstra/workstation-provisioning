class apps::steam {
  require desktop

  install::deb { 'steam':
    file  => "${base::userhome}/Downloads/steam.deb",
    url   => 'https://steamcdn-a.akamaihd.net/client/installer/steam.deb',
  }

}
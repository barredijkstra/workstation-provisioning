class drivers::nvidia(
  String $version
) {
  install::ppa { "nvidia-${version}":
    ppa => 'ppa:graphics-drivers/ppa'
  }
}
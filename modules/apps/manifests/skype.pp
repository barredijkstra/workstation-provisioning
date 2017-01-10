class apps::skype {
  require desktop
  require install::enable_i386

  $prereq = [ 'libc6:i386','libx11-6:i386','libxext6:i386','libxss1:i386','libxv1:i386','libssl1.0.0:i386','libpulse0:i386','libasound2-plugins:i386','libqt4-dbus:i386',
    'libqt4-network:i386','libqt4-xml:i386','libqtcore4:i386','libqtgui4:i386','libqtwebkit4:i386','sni-qt','sni-qt:i386']
  ensure_packages(
    $prereq,
    { ensure => present }
  )

  install::deb { 'skype':
    file    => "${base::userhome}/Downloads/skype.deb",
    url     => 'http://www.skype.com/go/getskype-linux-beta-ubuntu-64',
    require => Package['libqtcore4:i386']
  }
}
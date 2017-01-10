class install::enable_i386 {

  exec { '/usr/bin/dpkg --add-architecture i386':
    unless => '/bin/grep -q i386 /var/lib/dpkg/arch',
    notify => Exec['apt_update'],
  }

}
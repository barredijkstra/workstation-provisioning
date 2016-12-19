class desktop {
  require base

  $packages = [
    'ubuntu-desktop',
    'gnome-tweak-tool',
    'unity-tweak-tool',
    'network-manager-openvpn-gnome',
    'gksu',
    'terminator',
    'xdotool',
    'vim-gtk',
    'redshift-gtk',
  ]
  ensure_packages(
    $packages, { ensure => present }
  )

  class { 'desktop::clean_unity': }
}

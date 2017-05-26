class desktop {
  require base

  $packages = [
    'ubuntu-desktop',
    'unity-tweak-tool',
    'network-manager-openvpn-gnome',
    'indicator-multiload',
    'gksu',
    'terminator',
    'xdotool',
    'vim-gtk',
    'redshift-gtk',
  ]
  ensure_packages(
    $packages, { ensure => latest }
  )

  class { 'desktop::clean_unity': }
}

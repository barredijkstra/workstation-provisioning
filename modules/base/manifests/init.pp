class base {
  $user = hiera('user')
  $userhome = "/home/${user}"
  $os_distro = $facts[os][distro][id]
  $os_codename = $facts[os][distro][codename]
  $os_version = $facts[os][distro][release][major]
  $os_cpu = $facts[os][hardware]
  $os_arch = $facts[os][architecture]


  @user { $user:
    ensure  => present,
    shell   => '/bin/zsh',
    require => Package['zsh'],
  }

  $packages = [
    'ubuntu-restricted-extras',
    'build-essential',
    'linux-headers-generic',
    'linux-image-extra-virtual',
    'curl',
    'wget',
    'tzdata',
    'ca-certificates',
    'apt-transport-https',
    'python-apt',
    'openssl',
    'ppa-purge',
    'owncloud-client',
    'htop',
    'screen',
    'unsort',
    'nmap',
    'pwgen',
    'p7zip-full',
    'unzip',
    'tmux',
    'urlview',
    'mono-dmcs',
    'dnsmasq',
    'libmono-system-management4.0-cil',
    'vim',
    'zsh',
    'rng-tools',
  ]
  /*
  ensure_packages($packages, {
    ensure        => present,
    allow_virtual => true,
  })
  */
  package { $packages:
    ensure        => latest,
    allow_virtual => true,
  }

  if $is_virtual {
    $haveged_ensure = absent
  }else {
    $haveged_ensure = latest
  }
  package { 'haveged':
    ensure        => $haveged_ensure,
  }

  realize(User[$user])

  $user_directories = [
    $userhome,
    "${userhome}/bin",
    "${userhome}/Apps",
    "${userhome}/Desktop",
    "${userhome}/Downloads",
    "${userhome}/Documents",
    "${userhome}/Music",
    "${userhome}/projects",
    "${userhome}/.local",
    "${userhome}/.local/share",
    "${userhome}/.local/share/applications",
  ]
  ensure_resource('file', $user_directories, {
    ensure  => directory,
    owner   => $user,
    group   => $user,
    require => User[$user],
  })

  include apt
  include wget
  class { 'base::zsh': }
}

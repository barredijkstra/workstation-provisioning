class apps::git {
  require base

  ensure_packages([ 'git','gitk','myrepos' ], { 'ensure' => 'present' })

  file { "${base::userhome}/bin/mr-refresh":
    ensure => file,
    source => 'puppet:///modules/apps/git/mr-refresh',
    mode => '0755',
  }
}
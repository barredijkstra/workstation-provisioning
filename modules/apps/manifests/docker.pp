class apps::docker(
  Boolean $allow_user_access = true,
  String  $dockercompose_version,
) {
  require base

  include docker
  class { 'docker::compose':
    ensure => present,
  }

  /*
  install::repo { 'docker-engine':
    repo_location => 'https://apt.dockerproject.org/repo',
    repo_name     => 'docker',
    repo_release  => downcase("${base::os_distro}-${base::os_codename}"),
    repo_key      => {
      id     => '58118E89F3A912897C070ADBF76221572C52609D',
      server => 'hkp://ha.pool.sks-keyservers.net:80',
    }
  }

  exec { 'install docker-compose':
    command => "curl -L https://github.com/docker/compose/releases/download/${dockercompose_version}/docker-compose-Linux-x86_64 > /usr/local/bin/docker-compose",
    path    => $::path,
    creates => '/usr/local/bin/docker-compose',
    require => Install::Repo['docker-engine'],
  } -> file { '/usr/local/bin/docker-compose':
    ensure => present,
    mode   => '0755'
  }
  */

  /*
  if $allow_user_access {
    User <| title == $base::user |> { groups +> 'docker' }
  }
  */
}

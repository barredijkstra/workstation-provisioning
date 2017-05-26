class apps::intellij (
  $version,
) {
  require base
  require desktop

  $install_path = "${base::userhome}/Apps/idea-IU-${version}"
  $idea_path = "${base::userhome}/Apps/intellij-idea"

  file { $install_path:
    ensure => 'directory'
  }
  install::tgz { 'intellij.tar.gz':
    download_url     => "https://download.jetbrains.com/idea/ideaIU-${version}.tar.gz",
    download_target  => "${base::userhome}/Downloads/intellij.tar.gz",
    target_path      => $install_path,
    creates          => "${install_path}/bin/idea.sh",
    strip_components => 1,
  }

  file { $idea_path:
    ensure => link,
    target => $install_path,
    owner  => $base::user,
  }

  desktop::shortcut { 'intellij-idea':
    display_name => 'IntelliJ IDEA',
    comment      => 'IntelliJ IDEA',
    exec_path    => "${idea_path}/bin/idea.sh",
    icon         => "${idea_path}/bin/idea.png",
    categories   => [ 'Development', 'IDE' ],
    user         => $base::user,
    on_desktop   => true,
  }
}

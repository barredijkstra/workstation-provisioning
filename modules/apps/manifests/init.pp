class apps(
  String $java_version,
  String $dockercompose_version,
  String $scala_version,
  String $sbt_version,
  String $gradle_version,
  String $maven_version,
  String $intellij_version,
) {
  $packages = [
    'pidgin',
    'pidgin-otr',
    'gimp',
    'inkscape',
    'vlc',
    'remmina',
    'dia',
    'libreoffice',
    'gnome-twitch',
  ]
  ensure_packages($packages, { ensure => present })

  class { 'apps::firefox': }
  class { 'apps::firefox_plugins': }
  class { 'apps::googlechrome': }
  class { 'apps::googlechrome_apps': }
  class { 'apps::atom': }
  class { 'apps::keepass2': }
  class { 'apps::rambox': }
  class { 'apps::skype': }
  class { 'apps::spotify': }
  class { 'apps::steam': }

  class { 'apps::git': }
  class { 'apps::docker': dockercompose_version => $dockercompose_version, }
  class { 'apps::vagrant': }
  apps::openjdk { $java_version: }
  class { 'apps::sdkman': }
  apps::scala { $scala_version: sbt_version => $sbt_version }
  apps::gradle { $gradle_version: }
  apps::maven { $maven_version: }
  class { 'apps::nodejs': }
  class { 'apps::intellij': version => $intellij_version }
}

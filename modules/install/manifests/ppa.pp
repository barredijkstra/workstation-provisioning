define install::ppa(
  String $ppa,
) {

  if !defined(Apt::Ppa[$ppa]) {
    apt::ppa { $ppa: }
  }

  package { $name:
    ensure  => 'installed',
    require => Apt::Ppa[$ppa],
  }
}
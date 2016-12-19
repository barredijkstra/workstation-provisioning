define apps::openjdk(
  String $version = $name
) {
  package { "openjdk-${version}-jdk":
    ensure => present
  }
}

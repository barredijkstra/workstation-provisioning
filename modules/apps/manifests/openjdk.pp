define apps::openjdk (
  $version = $title,
  $ensure  = 'present'
) {
  ensure_packages([ "openjdk-${version}-jdk" ], { ensure => $ensure })
}

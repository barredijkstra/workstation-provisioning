class apps::owncloud (
  $ensure  = 'present'
) {
  ensure_packages([ "owncloud-client" ], { ensure => $ensure })
}

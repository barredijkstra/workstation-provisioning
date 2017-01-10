class apps::atom (
  $version = $title,
  $ensure  = 'present',
) {
  install::deb { 'atom-amd64.deb':
    file => "${base::userhome}/Downloads/atom-amd64.deb",
    url  => "https://github.com/atom/atom/releases/download/v${version}/atom-amd64.deb",
  }
}

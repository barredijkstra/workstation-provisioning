define apps::firefox::plugin (
  $plugin_name = $title,
  $url,
  $ensure      = 'present',
) {
  require wget
  require apps::firefox

  if !$ensure in [ 'present', 'absent'] {
    fail("$ensure is not a valid value for apps::firefox::plugin[$title].ensure. Must be either 'present' or 'absent'")
  }
  $filename = "/usr/lib/firefox/distribution/extensions/${plugin_name}"

  if $ensure == 'present' and !defined(File[$filename]) {
    wget::fetch { $url:
      destination => $filename,
      require     => Package['firefox'],
    } -> File { $filename: }
  } elsif $ensure == 'absent' {
    file { $filename: ensure => 'absent' }
  }
}
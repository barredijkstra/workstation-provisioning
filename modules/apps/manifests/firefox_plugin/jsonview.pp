class apps::firefox_plugin::jsonview(
  $ensure = 'present',
) {
  require apps::firefox

  apps::firefox::plugin { 'jsonview@brh.numbera.com.xpi':
    url => 'https://addons.mozilla.org/firefox/downloads/latest/jsonview/addon-10869-latest.xpi?src=dp-btn-primary',
  }
}
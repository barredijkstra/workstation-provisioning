class apps::firefox_plugin::xmarks_sync {
  require apps::firefox

  apps::firefox::plugin { 'foxmarks@kei.com.xpi':
    url => 'https://addons.mozilla.org/firefox/downloads/latest/xmarks-sync/addon-2410-latest.xpi',
  }
}
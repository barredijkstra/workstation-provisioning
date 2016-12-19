class apps::firefox_plugins {
  require apps::firefox

  [
    { name => '{e5bbc237-c99b-4ced-a061-0be27703295f}.xpi', url  => 'https://addons.mozilla.org/firefox/downloads/latest/hide-tab-bar-with-one-tab/addon-429664-latest.xpi', },
    { name => 'foxmarks@kei.com.xpi', url  => 'https://addons.mozilla.org/firefox/downloads/latest/xmarks-sync/addon-2410-latest.xpi', },
    { name => 'jsonview@brh.numbera.com.xpi', url  => 'https://addons.mozilla.org/firefox/downloads/latest/jsonview/addon-10869-latest.xpi?src=dp-btn-primary', },
  ].each | $addon | {
    apps::firefox::plugin { $addon['name']:
      url => $addon['url'],
    }
  }
}
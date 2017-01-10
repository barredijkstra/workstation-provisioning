class apps::firefox_plugin::hide_tabbar_with_one_tab(
  $ensure = 'present',
) {
  require apps::firefox

  apps::firefox::plugin { '{e5bbc237-c99b-4ced-a061-0be27703295f}.xpi':
    url => 'https://addons.mozilla.org/firefox/downloads/latest/hide-tab-bar-with-one-tab/addon-429664-latest.xpi',
  }
}
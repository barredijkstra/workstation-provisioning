class apps::firefox_plugins {
  require apps::firefox

  include apps::firefox_plugin::hide_tabbar_with_one_tab
  include apps::firefox_plugin::xmarks_sync
  include apps::firefox_plugin::jsonview
}
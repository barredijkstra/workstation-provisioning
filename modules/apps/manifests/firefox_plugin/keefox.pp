class apps::firefox::plugin {
  require apps::keepass2

  wget::fetch { 'https://addons.mozilla.org/firefox/downloads/latest/keefox/platform:2/addon-306880-latest.xpi':
    destination => '/usr/lib/firefox/distribution/extensions/keefox@chris.tomlinson.xpi',
    require     => [
      Package['keepass2'],
      Package['firefox']
    ]
  }
  archive { 'KeePassRPC.plgx':
    path            => '/usr/lib/firefox/distribution/extensions/keefox@chris.tomlinson.xpi',
    extract         => true,
    extract_path    => '/usr/lib/keepass2/',
    extract_command => 'unzip -jo %s deps/KeePassRPC.plgx',
    creates         => '/usr/lib/keepass2/KeePassRPC.plgx',
    require         => Wget::Fetch['https://addons.mozilla.org/firefox/downloads/latest/keefox/platform:2/addon-306880-latest.xpi'],
  }

}
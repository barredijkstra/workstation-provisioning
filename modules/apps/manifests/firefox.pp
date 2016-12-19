class apps::firefox {
  require desktop

  package { 'firefox':
    ensure => present,
  }

  define plugin(
    String $url
  ) {
    require wget

    wget::fetch { $url:
      destination =>  "/usr/lib/firefox/distribution/extensions/${name}"
    }
  }
}
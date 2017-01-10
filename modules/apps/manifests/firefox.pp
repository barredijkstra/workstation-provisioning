class apps::firefox {
  require desktop

  ensure_packages([ 'firefox'], { ensure => 'latest' })

  define plugin (
    String $url
  ) {
    require wget
    require apps::firefox

    wget::fetch { $url:
      destination => "/usr/lib/firefox/distribution/extensions/${name}",
      require     => Package['firefox'],
    }
  }
}
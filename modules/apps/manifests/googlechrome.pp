class apps::googlechrome {
  require desktop

  package { 'libappindicator1':
    ensure  => 'installed'
  }

  install::dpkg { 'google-chrome-stable':
    file  => "${base::userhome}/Downloads/google-chrome.deb",
    url   => 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb',
  }

  define app(
    String $user = $base::user,
    String $url,
  ) {
    file { "/home/${user}/.local/share/applications/${name}.desktop":
      ensure  => file,
      content => epp('apps/chrome_app.desktop', {
        display_name => $name,
        url          => $url
      })
    }
  }
}
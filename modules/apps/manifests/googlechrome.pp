class apps::googlechrome {
  require desktop

  package { 'libappindicator1':
    ensure => 'installed'
  }

  install::deb { 'google-chrome-stable':
    file    => "${base::userhome}/Downloads/google-chrome.deb",
    url     => 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb',
    require => Package['libappindicator1'],
  }

  define app (
    $url,
    $app_name = $title,
    $user     = $base::user,
  ) {
    file { "/home/${user}/.local/share/applications/${app_name}.desktop":
      ensure  => file,
      content => epp('apps/chrome_app.desktop', {
        display_name => $app_name,
        url          => $url
      })
    }
  }
}
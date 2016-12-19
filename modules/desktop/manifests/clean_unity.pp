class desktop::clean_unity {
  $appspurge = [
    '^empathy',
    '^transmission',
    '^shotwell',
    '^totem',
    '^account-plugin-',
    '^friends',
    'thunderbird',
    'gnome-orca',
    'gnomine',
    'gnome-sudoku',
    'gnome-mahjongg',
    '^unity-webapps-',
  ]
  ensure_packages( $appspurge, { ensure => purged })

  #Work-around to make sure the Owncloud icon is shown.
  if $facts['os']['release']['full'] == '16.04' {
    package { 'appmenu-qt5':
      ensure => 'absent',
    }
  }

  $settings = [
    #"dconf write \"/org/compiz/profiles/unity/plugins/unityshell/show-launcher\" '\"\"'",
    #"dconf write \"/org/compiz/integrated/show-hud\" \"['disable']\"",
    "gsettings set org.compiz.integrated show-hud \"['l']\"",
    "gsettings set com.canonical.Unity always-show-menus false",
    "gsettings set com.canonical.Unity.ApplicationsLens display-available-apps false",
    "gsettings set com.canonical.Unity.ApplicationsLens display-recent-apps false",
    "gsettings set com.canonical.Unity.Lenses remote-content-search none",
    "gsettings set com.canonical.Unity.Lenses disabled-scopes \"[]\"",
    "gsettings set com.canonical.indicator.power show-percentage true",
    "gsettings set com.canonical.indicator.power show-time true",
    "gsettings set com.canonical.unity-greeter background-color '#241916'",
    "gsettings set com.canonical.unity-greeter background '/usr/share/backgrounds/warty-final-ubuntu.png'",
    "gsettings set com.canonical.unity-greeter draw-grid true",
    "gsettings set com.canonical.unity-greeter draw-user-backgrounds true",
    "gsettings set com.canonical.unity-greeter font-name 'Ubuntu 11'",
    #    "gsettings set com.canonical.unity-greeter indicators ['ug-accessibility', 'com.canonical.indicator.keyboard', 'com.canonical.indicator.session', 'com.canonical.indicator.datetime', 'com.canonical.indicator.power', 'com.canonical.indicator.sound', 'application']",
    "gsettings set com.canonical.unity-greeter logo '/usr/share/unity-greeter/logo.png'",
    "gsettings set com.canonical.unity-greeter onscreen-keyboard false",
    "gsettings set com.canonical.unity-greeter play-ready-sound false",
    "gsettings set com.canonical.unity-greeter screen-reader false",
    "gsettings set org.gnome.desktop.privacy remember-recent-files false",
    "gsettings set com.canonical.Unity home-expanded 'Expanded'",
  ]
  $settings.each| String $setting | {
    exec { $setting:
      command => $setting,
      user    => $base::user,
      cwd     => $base::userhome,
      path    => $::path,

    }
  }
}

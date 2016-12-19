class apps::googlechrome_apps {
  require apps::googlechrome
  [
    { name => 'Netflix', url => 'https://netflix.com' },
    { name => 'WhatsApp', url => 'https://web.whatsapp.com' },
    { name => 'Google Hangouts', url => 'https://hangouts.google.com' },
  ].each| Hash $app | {
    apps::googlechrome::app { $app[name]:
      user => $base::user,
      url  => $app[url],
    }
  }
}

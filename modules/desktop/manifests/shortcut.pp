define desktop::shortcut (
  $shortcut_name = $title,
  $display_name  = $title,
  $exec_path,
  $user          = $base::user,
  $comment       = undef,
  $categories    = ['Application'],
  $terminal      = false,
  $icon          = undef,
  $on_desktop    = false,
) {
  require desktop
  require base

  $menu_file = "/home/${user}/.local/share/applications/${shortcut_name}.desktop"
  if $on_desktop {
    $shortcut_files = [ $menu_file, "/home/${user}/Desktop/${shortcut_name}.desktop"]
  } else {
    $shortcut_files = [ $menu_file ]
  }

  file { $shortcut_files:
    ensure  => file,
    content => epp('desktop/desktop_shortcut.desktop', {
      display_name => $display_name,
      icon         => $icon,
      comment      => $comment,
      categories   => $categories,
      exec_path    => $exec_path,
      terminal     => $terminal,
    }),
    mode    => '0755',
    owner   => $user,
  }
}
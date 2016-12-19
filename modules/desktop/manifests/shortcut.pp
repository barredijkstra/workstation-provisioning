define desktop::shortcut(
  String $user = $base::user,
  String $display_name,
  String $comment,
  String $exec_path,
  Array[String] $categories = ['Application'],
  Boolean $terminal = false,
  String $icon = undef,
) {
  require desktop

  file { "/home/${user}/.local/share/applications/${name}.desktop":
    ensure  => file,
    content => epp('desktop/desktop_shortcut.desktop', {
      display_name => $display_name,
      icon         => $icon,
      comment      => $comment,
      categories   => $categories,
      exec_path    => $exec_path,
      terminal     => $terminal,
    }),
    owner   => $user,
  }
}
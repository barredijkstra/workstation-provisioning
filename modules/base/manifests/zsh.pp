class base::zsh (
  String        $theme,
  String        $theme_url = "",
  Array[String] $plugins   = [ 'git' ],
){
  ohmyzsh::install { $base::user: }

  if $theme_url != "" {
    ohmyzsh::fetch::theme { $base::user:
      url => $theme_url
    }
  }

  ohmyzsh::theme { $base::user:
    theme => $theme,
  }
  ohmyzsh::plugins { $base::user:
    plugins => join($plugins, ' '),
  }

}

define install::bash(
  Boolean $is_url = true,
  Boolean $run_as_root = false,
  String  $creates = '',
  String  $unless = '',
  Array[String] $env = [],
) {
  require base

  if $run_as_root {
    $user='root'
    $home='/root'
  } else {
    $user = $base::user
    $home = $base::userhome
  }

  if $is_url {
    $cmd = "curl -s ${name} | bash"
  } else {
    $cmd = "bash ${name}"
  }

  exec { $cmd:
    command     => $cmd,
    cwd         => $home,
    user        => $user,
    path        => $::path,
    creates     => $creates,
    unless      => $unless,
    environment => $env,
  }
}

define install::repo (
  $repo_name         = $title,
  $repo_location,
  $repo_release      = $base::os_codename,
  $repo_architecture = $base::os_arch,
  $repo_target       = 'main',
  $repo_key          = { },
) {
  require base
  require apt

  if !defined(Apt::Source[$repo_name]) {
    apt::source { $repo_name:
      location     => $repo_location,
      release      => $repo_release,
      architecture => $repo_architecture,
      repos        => $repo_target,
      key          => $repo_key,
    }
  }
}

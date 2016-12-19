define install::repo(
  String $repo_name,
  String $repo_location,
  String $repo_release = $base::os_codename,
  String $repo_architecture = $base::os_arch,
  String $repo_target = 'main',
  Hash   $repo_key = { },
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

  package { $name:
    ensure  => 'installed',
    require => Apt::Source[$repo_name]
  }
}

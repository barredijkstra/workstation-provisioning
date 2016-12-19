define apps::maven (
  String  $version = $name,
  Boolean $default = true,
) {
  require apps::sdkman

  apps::sdkman::install { "maven ${version}":
    package => 'maven',
    version => $version,
    default => $default,
  }
}
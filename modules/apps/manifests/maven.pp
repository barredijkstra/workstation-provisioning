define apps::maven (
  $version = $name,
) {
  require apps::sdkman

  apps::sdkman::install { "maven_${version}":
    package => 'maven',
    version => $version,
  }
}
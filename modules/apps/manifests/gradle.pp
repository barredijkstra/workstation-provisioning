define apps::gradle (
  $version = $name,
) {
  require apps::sdkman

  apps::sdkman::install { "gradle_${version}":
    package => 'gradle',
    version => $version,
  }
}
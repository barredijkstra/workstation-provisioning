define apps::gradle (
  String  $version = $name,
  Boolean $default = true,
) {
  require apps::sdkman

  apps::sdkman::install { "gradle ${version}":
    package => 'gradle',
    version => $version,
    default => $default,
  }
}
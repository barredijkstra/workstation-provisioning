define apps::gradle (
  String  $version = $title,
  Boolean $default = true,
) {
  require apps::sdkman

  apps::sdkman::install { "gradle ${version}":
    package => 'gradle',
    version => $version,
    default => $default,
  }
}
define apps::scala (
  String  $version     = $name,
  String  $sbt_version = "",
  Boolean $default     = true,
) {
  require apps::sdkman

  apps::sdkman::install { "scala ${version}":
    package => 'scala',
    version => $version,
    default => $default,
  }

  unless $sbt_version == "" {
    apps::sdkman::install { "sbt ${sbt_version}":
      package => 'sbt',
      version => $sbt_version,
      default => $default,
    }
  }
}

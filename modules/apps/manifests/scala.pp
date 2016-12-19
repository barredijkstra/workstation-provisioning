define apps::scala (
  $version     = $name,
  $sbt_version = "",
) {
  require apps::sdkman

  apps::sdkman::install { "scala_${version}":
    package => 'scala',
    version => $version,
  }

  apps::sdkman::install { "sbt_${sbt_version}":
    package => 'sbt',
    version => $sbt_version,
  }
}

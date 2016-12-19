define install::tgz(
  String $download_url,
  String $download_target,
  String $target_path,
  String $creates,
  Integer $strip_components=0
) {
  archive { $name:
    source          => $download_url,
    path            => $download_target,
    extract         => true,
    cleanup         => true,
    extract_path    => $target_path,
    creates         => $creates,
    extract_command => "tar xfz %s --strip-components=${strip_components}",
  }
}
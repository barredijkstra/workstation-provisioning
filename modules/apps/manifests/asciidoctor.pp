class apps::asciidoctor (
  $ensure  = 'latest'
){
  ensure_packages([ 'asciidoctor'], { ensure => $ensure })
}
class apps::minikube {
  require apps::docker
  require apps::kubectl
  require apps::vagrant

  install::deb { 'minikube':
    file  => "${base::userhome}/Downloads/minikube_0.19-0.deb",
    url   => 'https://github.com/kubernetes/minikube/releases/download/v0.19.0/minikube_0.19-0.deb',
  }
}
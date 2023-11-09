provider "helm" {
  kubernetes {
    config_path = "~/.kube/config" // Path to your kube config file
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config" // Path to your kube config file
}


resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "metrics-server"
  namespace  = "kube-system"

  set {
    name  = "apiService.create"
    value = "true"
  }

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "replicas"
    value = "1"
  }
}
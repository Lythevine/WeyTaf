provider "kubernetes" {
  config_path = "~/.kube/config"
  }

#creation of three pod
resource "kubernetes_pod_v1" "my-test" {
  metadata {
    name = "myfirst-pod"
    namespace = "rashid"
    labels = {
          owner: lythevine
          type: service
        }
  }
  spec {
    container {
      name = "marwalythe"
      image = "lythevine/mymarwaney:my_marwaney"
    }
  }
}
#second pod
resource "kubernetes_pod_v1" "my-test2" {
  metadata {
    name = "mysecond-pod"
    namespace = "rashid"
    labels = {
          owner: lythevine
          type: service
        }
  }
  spec {
    container {
      name = "marwalythe2"
      image = "lythevine/mymarwaney:my_marwaney"
    }
  }
}
#third pod
resource "kubernetes_pod_v1" "my-test3" {
  metadata {
    name = "mythird-pod"
    namespace = "rashid"
    labels = {
          owner: lythevine
          type: service
        }
  }
  spec {
    container {
      name = "marwalythe3"
      image = "lythevine/mymarwaney:my_marwaney"
    }
  }
}
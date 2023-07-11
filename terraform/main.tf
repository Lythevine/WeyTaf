provider "kubernetes" {
  config_path = "~/.kube/config"
  }

#creation of three pod
resource "kubernetes_pod_v1" "my-test" {
  metadata {
    name = "myfirst-pod"
    namespace = "rashid"
  }
  spec {
    container {
      name = "marwalythe"
      image = "lythevine/mymarwaney:my_marwaney"
    }
  }
}
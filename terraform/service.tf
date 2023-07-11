  provider "kubernetes" {
  config_path = "~/.kube/config"
  }

  resource "kubernetes_api_service_v1" "my_service" {
  metadata {
    name = "lythevine-service"
    namespace = "rashid"
    labels = {
      owner = lythevine
      type = service
    }
  }
  spec {
    selector {
      matchLabels = {
        owner = lythevine
        type = service
      }
    }
   
    ports {
      port = 8080
      target_port = 80
      nodePort = 30612
    }

    type = "nodePort"
  }
}
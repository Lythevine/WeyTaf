provider "kubernetes" {
  config_path    = "~/.kube/config"
}

locals {
     name = "backend" 
     type = "webapp"
     owner = "lythevine"
}

resource "kubernetes_deployment" "my_deployment" {
   metadata {
     namespace = "rashid"
     name = local.name
     #name = "${local.name}-pod"
     labels = {
       owner = local.owner
       type = local.type
     }
   }
  spec {
    template {
      metadata {
        namespace = "rashid"
        name = local.name
        labels = {
          owner = local.owner
          app  = local.type
        }
      }
      
      spec {
        container {
          name = "marwalythe"
          image = "lythevine/mymarwaney:my_marwaney"
          ports = {
            name = http
            containerPort = 80
          }
        }
      }
    
    }
   replicas = 3
   selector {
     match_labels = {
       owner = local.owner
       app = local.type
     }
   }
  }
}
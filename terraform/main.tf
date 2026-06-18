resource "kubernetes_namespace" "devops" {
  metadata {
    name = "devops"
  }
}


resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx-app"
    namespace = kubernetes_namespace.devops.metadata[0].name
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name              = "nginx"
          image             = "terraform-k8s-app:v4"
          image_pull_policy = "Never"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "nginx" {
  metadata {
    name      = "nginx-service"
    namespace = kubernetes_namespace.devops.metadata[0].name
  }

  spec {
    selector = {
      app = "nginx"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

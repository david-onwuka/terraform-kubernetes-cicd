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

    strategy {
      type = "RollingUpdate"

      rolling_update {
        max_surge       = "1"
        max_unavailable = "1"
      }
    }

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

          readiness_probe {
            http_get {
              path = "/"
              port = 80
            }

            initial_delay_seconds = 5
            period_seconds        = 5
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80
            }

            initial_delay_seconds = 15
            period_seconds        = 20
          }

          resources {
            requests = {
              cpu    = "100m"
              memory = "128Mi"
            }

            limits = {
              cpu    = "250m"
              memory = "256Mi"
            }
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

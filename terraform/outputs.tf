output "namespace" {
  description = "Kubernetes namespace used for deployment"
  value       = kubernetes_namespace.devops.metadata[0].name
}


output "service_name" {
  description = "Kubernetes service name"
  value       = kubernetes_service.nginx.metadata[0].name
}


output "application_url_command" {
  description = "Command to access application"
  value       = "minikube service nginx-service -n devops --url"
}

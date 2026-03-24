terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

# Kubernetes provider
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Helm provider
provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

# Helm release (NGINX)
resource "helm_release" "nginx" {
  name             = "nginx"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "nginx"
  namespace        = "default"
  create_namespace = true # Changed to true for better portability

  set = [
    {
      name  = "service.type"
      value = "NodePort"
    },
    {
      name  = "service.nodePorts.http"
      value = "30080"
    },
    {
      name  = "replicaCount"
      value = "2" # Pass as a string to ensure Helm compatibility
    }
  ]
}

# --- Outputs ---

output "nginx_status" {
  value       = helm_release.nginx.status
  description = "The status of the Helm release."
}

output "nginx_endpoint" {
  value       = "http://localhost:30080"
  description = "If using Docker Desktop or Minikube (with tunnel), access NGINX here."
}

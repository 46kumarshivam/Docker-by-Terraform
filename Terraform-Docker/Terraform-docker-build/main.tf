terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.0.0"
    }
  }
}

provider "docker" {}

# Build Docker image
resource "docker_image" "myapp" {
  name = "myapp:latest"

  build {
    context    = "${path.module}"  # current folder
    dockerfile = "Dockerfile"
  }
}

# Run container
resource "docker_container" "myapp_container" {
  name  = "myapp"
  image = docker_image.myapp.image_id

  ports {
    internal = 80
    external = 9093
  }
}
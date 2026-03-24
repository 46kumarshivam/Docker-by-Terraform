terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.0.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  count = length(var.nginx_ports)
  name  = "my-nginx-${count.index + 1}"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.nginx_ports[count.index]
  }
}

resource "docker_container" "nginx2" {
  name  = "my-nginx2"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 9092
  }
}
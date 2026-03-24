output "nginx_urls" {
  value = [for i in docker_container.nginx : "http://localhost:${i.ports[0].external}"]
}
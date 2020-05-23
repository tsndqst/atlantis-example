resource "null_resource" "example" {
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create NGINX container
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "enginecks"
  ports {
    internal = 80
    external = 80
  }
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

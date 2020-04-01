mkdir -p ~/terraform-docker-demo
tee ~/terraform-docker-demo/main.tf <<EOF
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 80
  }
}
resource "docker_image" "nginx" {
  name = "nginx:latest"
}
EOF
cd ~/terraform-docker-demo

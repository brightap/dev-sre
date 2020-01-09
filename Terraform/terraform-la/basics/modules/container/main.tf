#start the container
resource "docker_container" "contanier_id" {
  name = "${var.container_name}"
  image = "${var.image}"
  ports {
      internal = "${var.int_port}"
      external = "${var.ext_port}"
  }
}

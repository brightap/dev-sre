#donwload the latest Ghost Image
resource "docker_image" "image_id" {
  name = "${lookup(var.image_name, var.env)}"
}

#start the container
resource "docker_contianer" "container_id" {
  name = "${lookup(var.container_name, var.env)}"
  image = "${docker_image.image_id.latest}"
  ports = {
      internal = "${var.int_port}"
      external = "${lookup(var.ext_port, var.env)}"
  }
}

resource "null_resource" "null_id" {
  provisioner "local-exec" {
    command = "echo ${docker_contianer.container_id.name}:${docker_contianer.container_id.ip_address} >> container.txt"
  }
}

#assigment create variables

variable "image_name" {
  description ="Image of the container"
  default = "ghost:latest"
}

variable "container_name" {
  description = "name of the container"
  default = "ghost_blog"
}

variable "ext_port" {
  default = "80"
}


resource "docker_image" "ghost_image" {
  name = "${var.image_name}"
}

resource "docker_container" "ghost_container" {
  name = "${var.container_name}"
  image = "${docker_image.ghost_image}"
  ports = {
    internal = "2368"
    external = "${var.ext_port}"
  }
}




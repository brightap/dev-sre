#Output the Ip adddress of the container
output "ip" {
  value = "${module.ghost.ip}"
}

output "container_name" {
  value = "${module.ghost.container_name}"
}


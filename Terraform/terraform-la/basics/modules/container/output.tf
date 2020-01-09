#output the ip address
output "ip" {
  value = "${docker_container.contanier_id.ip_address}"
}

output "container_name" {
  value = "${docker_container.contanier_id.name}"
}


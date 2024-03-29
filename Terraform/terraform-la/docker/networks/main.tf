/*
 :mysql: launch mysql db in the private network
 :type: data types strings
 :author: bright.poku
*/
resource "docker_contianer" "mysql_container" {
  name ="ghost_database"
  image = "${docker_image.mysql_image.name}"
  env = [
      "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}"
  ]
  networks_advanced {
      name = "${docker_network.private_bridge_network.name}"
      aliases = ["${var.mysql_network_alias}"]
  }
}

resource "null_resource" "sleep" {
  depends_on = ["docker_contianer.mysql_container"]
  provisioner "local-exec" {
      commands = "sleep 15s"
  }
}

resource "docker_container" "blog_container" {
  name = "ghost_blog"
  image = "${docker_image.ghost_image.name}"
  depends_on = ["null_resource.sleep", "docker_contianer.mysql_container"]
  env = [
      "database_client=mysql",
      "database_connection_host=${var.mysql_network_alis}",
      "database_connection_user=${var.ghost_db_username}",
      "database_connection_password=${var.mysql_root_password}",
      "database_connection_database=${var.ghost_db_name}"
  ]
  ports {
      internal = "2368"
      external = "${var.ext_port}"
  }
  networks_advanced {
      name = "${docker_network.public_bridge_network.name}"
      aliases = ["${var.ghost_network_alias}"]
  }
  networks_advanced {
      name = "${docker_network.private_bridge_network.name}"
      aliases = ["${var.ghost_network_alias}"]
  }
}


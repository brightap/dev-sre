#declare all variables here
variable "mysql_root_password" {
  description = "The MYSQL root password"
  default = "P4sSw0rd0!"
}

variable "ghost_db_username" {
  description ="ghost blog database username"
  default = "root"
}

variable "ghost_db_name" {
  description = "The ghost blog database name"
  default = "ghost"
}

variable "mysql_network_alias" {
  description = "the network alias for mysql"
  default = "db"
}

variable "ghost_network_alias" {
  description = "the network alias for ghost"
  default = "db"
}
variable "ext_port" {
  description = "public port for ghost blog"
  default = "8080"
}







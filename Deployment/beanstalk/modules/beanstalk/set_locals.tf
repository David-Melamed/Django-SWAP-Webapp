resource "null_resource" "example" {

provisioner "local-exec" {
    command = "true"

    environment = {
        DB_NAME = var.db_name
        DB_USER = var.db_username
        DB_PASSWORD = var.db_password
        DB_HOST = var.db_host
        DB_PORT = var.db_port
        APP_IMAGE = var.app_image
        TAG      = var.app_tag
    }
  }
}
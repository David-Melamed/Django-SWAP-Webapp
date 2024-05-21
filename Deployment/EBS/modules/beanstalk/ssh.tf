resource "null_resource" "prepare_directories" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      mkdir -p ../.platform/ssh
    EOT
  }
}

resource "null_resource" "copy_ssh_key" {
  depends_on = [null_resource.prepare_directories]

  provisioner "local-exec" {
    command = "cp ${var.path_to_ssh_public_key} ../.platform/ssh/id_rsa.pub"
  }
}

variable "path_to_ssh_public_key" {
  description = "The path to the SSH public key"
  default     = "~/.ssh/id_rsa.pub"
}

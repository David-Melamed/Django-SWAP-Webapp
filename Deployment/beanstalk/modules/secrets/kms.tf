  data "aws_caller_identity" "current" {}
  data "aws_region" "current" {}

  resource "aws_kms_key" "kms_key" {
    description             = "KMS key for swapp application encryption"
    deletion_window_in_days = 7  # Set the number of days before deletion
    policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Enable IAM User Permissions",
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        "Action": "kms:*",
        "Resource": "*"
      }
    ]
  }
  POLICY
  }

  resource "aws_kms_alias" "kms_alias" {
    name          = "alias/${var.kms_alias}"
    target_key_id = aws_kms_key.kms_key.key_id
  }


  resource "null_resource" "create_alias" {
    provisioner "local-exec" {
      command = <<EOT
        chmod +x ${path.module}/encrypt.sh &&
        ALIAS_EXISTS=$(aws kms list-aliases --query 'Aliases[?AliasName==`alias/${var.kms_alias}`].AliasName' --output text) &&
        if [ -z "$ALIAS_EXISTS" ]; then
          aws kms create-alias --alias-name alias/${var.kms_alias} --target-key-id ${aws_kms_key.kms_key.key_id}
        else
          echo "Alias already exists."
        fi
      EOT
    }
  }

  data "external" "encrypt_db_name" {
    count   = length(var.db_name) > 0 ? 1 : 0
    program = ["${path.module}/encrypt.sh", aws_kms_key.kms_key.key_id, var.db_name, data.aws_region.current.name]
  }

  data "external" "encrypt_db_username" {
    count   = length(var.db_username) > 0 ? 1 : 0
    program = ["${path.module}/encrypt.sh", aws_kms_key.kms_key.key_id, var.db_username, data.aws_region.current.name]
  }

  data "external" "encrypt_db_password" {
    count   = length(var.db_password) > 0 ? 1 : 0
    program = ["${path.module}/encrypt.sh", aws_kms_key.kms_key.key_id, var.db_password, data.aws_region.current.name]
  }

resource "null_resource" "remove_credentials_file_when_apply" {
  provisioner "local-exec" {
    when    = create
    command = "rm -f ${path.module}/credentials.json"
  }
}

resource "local_file" "credentials" {
  content = jsonencode({
    db_name     = var.db_name,
    db_username = var.db_username,
    db_password = var.db_password
  })
  filename = "${path.module}/credentials.json"
  
  lifecycle {
      create_before_destroy = true
    }

  provisioner "local-exec" {
    command = <<EOT
      if [ ! -f "${path.module}/credentials.json" ]; then
        echo '${jsonencode({
          db_name     = var.db_name,
          db_username = var.db_username,
          db_password = var.db_password
        })}' > "${path.module}/credentials.json"
      fi
    EOT
    when    = create
  }
}


locals {
  credentials = jsondecode(local_file.credentials.content)
}

  data "aws_kms_secrets" "db_dev" {
    secret {
      name    = "db_name"
      payload = length(local.credentials.db_name) > 0 ? data.external.encrypt_db_name[0].result["encrypted_text"] : ""
    }
    secret {
      name    = "db_username"
      payload = length(local.credentials.db_username) > 0 ? data.external.encrypt_db_username[0].result["encrypted_text"] : ""
    }
    secret {
      name    = "db_password"
      payload = length(local.credentials.db_password) > 0 ? data.external.encrypt_db_password[0].result["encrypted_text"] : ""
    }
  }

  resource "null_resource" "remove_credentials_file_when_destroy" {
  provisioner "local-exec" {
    when    = destroy
    command = "rm -f ${path.module}/credentials.json"
  }
}

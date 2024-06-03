# output "secret_arn" {
#   value = aws_secretsmanager_secret.app_secret.arn
# }

# output "app_secret_id" {
#   value = aws_secretsmanager_secret.app_secret.id
# }

output "db_name" {
  value = data.aws_kms_secrets.example.plaintext["db_name"]
}

output "db_username" {
  value = data.aws_kms_secrets.example.plaintext["db_username"]
}

output "db_password" {
  value = data.aws_kms_secrets.example.plaintext["db_password"]
}
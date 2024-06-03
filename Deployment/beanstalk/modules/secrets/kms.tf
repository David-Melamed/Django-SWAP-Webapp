data "aws_caller_identity" "current" {}

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


data "aws_kms_secrets" "db_dev" {
  secret {
    name    = "db_name"
    payload = "AQICAHggptUvWUY4BaFJK7wVVZ1yup88HuwekCWBPuzwuOcYfQGPI10JTbad0e6GAmU6/ta0AAAAaTBnBgkqhkiG9w0BBwagWjBYAgEAMFMGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMz9cu8kYwzwLZQjO7AgEQgCaBIsa/AVKVGuQ/JUlNLxN0sLwCrp8hHwvtfrpoZanWvXdNrl0Q+Q=="
  }
  secret {
    name    = "db_username"
    payload = "AQICAHggptUvWUY4BaFJK7wVVZ1yup88HuwekCWBPuzwuOcYfQHoMWa/aEIt37HxLQAbKqHrAAAAYjBgBgkqhkiG9w0BBwagUzBRAgEAMEwGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMkaznSypSC4kDzdu9AgEQgB9CGQmzbx7HC/PZDDbafRia1DUpBuB8TJ1DZSF7nLDR"
  }
  secret {
    name    = "db_password"
    payload = "AQICAHggptUvWUY4BaFJK7wVVZ1yup88HuwekCWBPuzwuOcYfQH9UVNq55xQhCaLaoXFA4gIAAAAaTBnBgkqhkiG9w0BBwagWjBYAgEAMFMGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMHhxVs4uni0CyNxRkAgEQgCZQDw1dR7ZiHg/6QRpynaoncwvRjIvhAXHR9oWF4kNxMNTuNiX+2Q=="
  }
}

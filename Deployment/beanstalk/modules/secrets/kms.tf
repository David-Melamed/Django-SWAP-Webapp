data "aws_caller_identity" "current" {}

resource "aws_kms_key" "kms_key" {
  description             = "KMS key for swapp application encryption"
#   deletion_window_in_days = 10  # Set the number of days before deletion

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
  name          = "alias/swapapp-dev"
  target_key_id = aws_kms_key.kms_key.key_id
}

data "aws_kms_secrets" "example" {
  secret {
    name    = "db_name"
    payload = "AQICAHggptUvWUY4BaFJK7wVVZ1yup88HuwekCWBPuzwuOcYfQHT1AriMTo77Uw5poqxb0nhAAAAbDBqBgkqhkiG9w0BBwagXTBbAgEAMFYGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQM6TMk2KTHtvSNSMOOAgEQgCmth27P33ADaJ+aVXBNXH5JtAQnKYDg5Tei3k+GyeoKd/xBmRT2P7DWGw=="
  }
  secret {
    name    = "db_username"
    payload = "AQICAHggptUvWUY4BaFJK7wVVZ1yup88HuwekCWBPuzwuOcYfQHoMWa/aEIt37HxLQAbKqHrAAAAYjBgBgkqhkiG9w0BBwagUzBRAgEAMEwGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMkaznSypSC4kDzdu9AgEQgB9CGQmzbx7HC/PZDDbafRia1DUpBuB8TJ1DZSF7nLDR"
  }
  secret {
    name    = "db_password"
    payload = "AQICAHggptUvWUY4BaFJK7wVVZ1yup88HuwekCWBPuzwuOcYfQH8aCCCJj1UAY3PzntC1R+uAAAAZjBkBgkqhkiG9w0BBwagVzBVAgEAMFAGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQM7aeX372249UEj/oKAgEQgCPxtKzNgiHyoTNioSK9pCgsVcZ7IWD2bJVL3YTNTLzelLhA9Q=="
  }
}

resource "aws_iam_policy" "kms_usage_policy" {
  name        = "KMSUsagePolicy"
  description = "Allow use of the KMS key"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Action    = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ],
        Resource  = aws_kms_key.kms_key.arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "kms_policy_attachment" {
  role       = "aws-elasticbeanstalk-ec2-role"
  policy_arn = aws_iam_policy.kms_usage_policy.arn
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

# S3 Bucket definition
resource "aws_s3_bucket" "capstone_bucket" {
  bucket = "capstone-etl-bucket" #bucket name
tags = {
    Name = "capstone-project" #tag name
  }
}


# IAM User definition
resource "aws_iam_user" "dokes" {
  name = "dokes"
}


resource "aws_redshift_cluster" "data_wareshouse" {
  
  cluster_identifier = "capstone-project"
  database_name      = "mydb"
  master_username    = "dokes"
  master_password    = "Password"
  node_type          = "dc2.large"
  cluster_type       = "single-node"
  skip_final_snapshot = true
}



####################################################################





# IAM Policy definition
# resource "aws_iam_policy" "capstone" {
#   name        = "capstone_policy"
#   description = "A policy to allow access to S3 bucket"
#   policy      = jsonencode({
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Effect": "Allow",
#         "Action": [
#           "s3:ListBucket"
#         ],
#         "Resource": [
#           "arn:aws:s3:::${aws_s3_bucket.example.bucket}"
#         ]
#       },
#       {
#         "Effect": "Allow",
#         "Action": [
#           "s3:GetObject",
#           "s3:PutObject",
#           "s3:DeleteObject"
#         ],
#         "Resource": [
#           "arn:aws:s3:::${aws_s3_bucket.capstone_bucket.bucket}/*"
#         ]
#       }
#     ]
#   })
# }

# # Attach the policy to the IAM user
# resource "aws_iam_user_policy_attachment" "capstone" {
#   user       = aws_iam_user.dokes.name
#   policy_arn = aws_iam_policy.capstone_policy.arn
# }

# # Output the user access keys (use with caution and handle securely)
# resource "aws_iam_access_key" "access_key" {
#   user = aws_iam_user.dokes.name
# }

# output "aws_access_key_id" {
#   value = aws_iam_access_key.capstone.id
# }

# output "aws_secret_access_key" {
#   value = aws_iam_access_key.capstone.secret
#   sensitive = true
# }

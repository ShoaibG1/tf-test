## PUT TERRAFORM CLOUD BLOCK HERE!  ##

terraform {
  
  cloud {
    organization = "shoaib_course"

    workspaces {
      name = "tf-cloud-test"
    }
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.01"
    }
  }



}


# Variable blocks directly within the main.tf. No arguments necessary.
# variable "aws_access_key" {}
# variable "aws_secret_key" {}
variable "region" {}

variable "hr_hub_etl_postgres_creds" {}
variable "hr_hub_etl_postgres_creds22" {}

# provider arguments call on the variables which then call on terraform.tfvars for the values.
provider "aws" {
  #access_key = var.aws_access_key
  #secret_key = var.aws_secret_key
  region     = var.region
}



resource "aws_secretsmanager_secret" "hr_hub_etl_postgres_creds" {
  description = "Credentials to run ETL jobs in HR Hub Postgres database"
  name        = "npr-hr_hub-etl-postgres-creds"
  tags        = {}
  tags_all    = {}
}

resource "aws_secretsmanager_secret_version" "hr_hub_etl_postgres_creds" {
  secret_id     = aws_secretsmanager_secret.hr_hub_etl_postgres_creds.id
  secret_string = jsonencode(var.hr_hub_etl_postgres_creds)
  lifecycle {
    ignore_changes = [
      secret_string
    ]
  }
}

resource "aws_secretsmanager_secret" "hr_hub_etl_postgres_creds22" {
  description = "Credentials to run ETL jobs in HR Hub Postgres database"
  name        = "npr-hr_hub-etl-postgres-creds22"
  tags        = {}
  tags_all    = {}
}

resource "aws_secretsmanager_secret_version" "hr_hub_etl_postgres_creds22" {
  secret_id     = aws_secretsmanager_secret.hr_hub_etl_postgres_creds22.id
  secret_string = jsonencode(var.hr_hub_etl_postgres_creds22)
  lifecycle {
    ignore_changes = [
      secret_string
    ]
  }
}


# Add .gitignore file in this directory with the terraform.tfvars

# resource "aws_instance" "tc_instance" {
#   ami           = "ami-0c7c4e3c6b4941f0f"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "TC-triggered-instance"
#   }
# }

# resource "aws_iam_user" "test-user-99" {
#   name = "test-user-99"
# }

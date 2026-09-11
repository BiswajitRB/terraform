terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.62.0"
    }
  }

  backend "s3" {
    bucket         = "my-tf-state-bucket-20260831-05"
    key      = "terraform.tfstate"
    dynamodb_table = "my-infra-state-table"
    region = "us-east-1"
    use_lockfile = true
  }
}

terraform {
  required_version = "1.4.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }

  backend "s3" {
    bucket = "c205-izee1"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}
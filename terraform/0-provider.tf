provider "aws" {
    region = "ap-northeast-2"
  }

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.19.0"
    }
  }
}

terraform {
  #   cloud {
  #     organization = "SammyCloud"

  #     workspaces {
  #       name = "terra-house-1"
  #     }
  #   }
  # }
  # terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.21.0"
    }
  }
}

provider "aws" {
}
provider "random" {
  # Configuration options
}

#0. Configure The Provider
terraform {
  backend "s3" {
    bucket         = "doktorsanti-s3statebackend062023"
    dynamodb_table = "doktorsanti-dynamodbtable"
    key            = "global/mystatefile34/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      
    }
  

    
  }
}

# Configuration options
provider "aws" {
  region = var.region
}



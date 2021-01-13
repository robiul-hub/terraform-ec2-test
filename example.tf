provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0be2609ba883822ec"
  instance_type = "t2.micro"
}

terraform {
+ backend "remote" {
+   organization = "<ORG_NAME>"
+   workspaces {
+     name = "Example-Workspace"
+   }
+ }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}


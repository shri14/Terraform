terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    required_version = "~>= 1.2.0"
  }
}
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "instance" {
  ami           = "ami-0c94855ba937ecf"
  instance_type = "t2.micro"
  count         = 2
  tags = {
    Name = "terraform-instance_example"
  }
}

output "public_ips" {
  value = aws_instance.instance[*].public_ip
}

resource "aws_s3_bucket" "aws2024" {
  bucket = "my-tf-test-bucket-2024"
  tags = {
    name        = "shrikar_bucket"
    Environment = "dev"
  }
}
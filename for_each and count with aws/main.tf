terraform {
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 3.0"
    }
    
}

}
provider "aws" {
    region = "ap-south-1"
  
}
locals {
  instance_name =toset(["Dev","Prod","Test","Stage"])
  instance_type = {
    "Dev":"t2.micro",
    "Prod":"t3.micro",
    "Test":"m3.medium",
    "Stage":"m3.medium"
}

}
# 4 instance with deffrent Instance types
 
resource"aws_instance" "fornend" {
  for_each = local.instance_name
  ami ="ami-0c9485b6c7ecd9"
  instance_type = local.instance_type[each.key]
  tags = {
    Name= each.key
  }
} 

# Meta Argumrnt 

There are 4 types of Meta Arguments :
    1. Count
    2. For_each
    3. depends_on
    3.lifecycle

resource"aws_instance" "fornend" {
  count         = 4
  ami ="ami-0c9485b6c7ecd9"
  instance_type = "t2.medium"
  tags = {
    Name= "instance"
  }
  
}
In the above example if we go with this 4 instance will be created with same name called instance


# count
count is a meta-argument defined by the Terraform language. It can be used with modules and with every resource type.
The count meta-argument accepts a whole number, and creates that many instances of the resource or module. Each instance has a distinct infrastructure object associated with it, and each is separately created, updated, or destroyed when the configuration is applied


if we go wtith blow examample  4 instnace will be created with instance-0,instance-2, instance-2 instance-3

resource"aws_instance" "fornend" {
  count         = 4
  ami ="ami-0c9485b6c7ecd9"
  instance_type = "t2.medium"
  tags = {
    Name= "instance - ${count.index}"
  } 
}

 # for_each 
The for_each meta-argument accepts a map or a set of strings, and creates an instance for each item in that map or set. Each instance has a distinct infrastructure object associated with it, and each is separately created, updated, or destroyed when the configuration is applied.

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
}

# what is locals in code ? locals are local varibale 


resource"aws_instance" "fornend" {
  for_each = local  .instance_name
  ami ="ami-0c9485b6c7ecd9"
  instance_type = "t2.medium"
  tags = {
    Name= each.key
  }

}

# 4 instance with deffrent instance type 

locals {
  instance_name =toset(["Dev","Prod","Test","Stage"])
  instance_type = {
    "Dev":"t2.micro",
    "Prod":"t3.micro",
    "Test":"m3.medium",
    "Stage":"m3.medium"
}

}

resource"aws_instance" "fornend" {
  for_each = local.instance_name
  ami ="ami-0c9485b6c7ecd9"
  instance_type = local.instance_type[each.key]
  tags = {
    Name= each.key
  }
} 

# depends on

Use the depends_on meta-argument to handle hidden resource or module dependencies that Terraform cannot automatically infer. You only need to explicitly specify a dependency when a resource or module relies on another resource's behavior but does not access any of that resource's data in its arguments.


# Lifecycle 

lifecycle is a nested block that can appear within a resource block. The lifecycle block and its contents are meta-arguments, available for all resource blocks regardless of type.

The arguments available within a lifecycle block are create_before_destroy, prevent_destroy, ignore_changes, and replace_triggered_by.


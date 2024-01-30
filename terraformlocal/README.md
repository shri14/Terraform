What is IAC (Infrastructure AS Code)?
Ans: Infrastructure as code (iaC) tools allow you to manage Infrastructure with configuration files rather than through graphical user interface . iaC allows you to build ,manage your Infrastructure in a a safe consistent ,and repeatble way by defining resource configurations you can version ,reuse ,and share '

What is terraform ?
ans: terraform is HashiCorp's insfrastructure as a code tool . it lets you define resources and infrastructure in human-readable ,declarative configuration files, and your infrastructure's lifecycle .using  terraform has several advantages over manually managing your infrastructure 
    . terraform can manage Infrastructure onm multiple cloud platforms 
    . The human-readable configuration language helps you write Infrastructure code quikly 
    . Terraform's state allows you to track resources changes throughout your deployment 
    . You can commit your configuration to version control to safely collaborate on Infrastructure

HCL(Hashicorp Configuration Language)
Hashicorp Configuration Language ,This low-level syntax of the terraform language is defined in terms of syntax called HCL, which is also used by configuration languages in other applications,
and in particular other HashiCorp products. It is not necessary to know all of the details of HCL syntax in order to use Terraform ,just knowinng the basics ,should be enough


<block> <parameters> {
    key1 = value1
    key1 = value2
} 


Block and Arguments

A block is a container for other content  and An argument assigns a value to a particuler name :
filename = "/home/ubuntu/abc12.txt"
The identifier before the equals signs in the argument name and the expression after the equals signs in the arguments value.

resource"local_file" "devops"{
    filename = "/root/devops.txt"
    content = "we love DevOps engginering "
}

local = provider file = provider type  "devops "=name of ther resources 


We can have multiple resources in one file
#provider is random and type is string 

resource "random_string" "rand-str" {     # THIS IS BLOCK REST OF IS ATRIBUTE 
    length           = 8
    special          = true
    override_special = "_!@#$%&*{}_%/?"     # this will replace the default special characters with _/%/
}   

output "rand-str" {
    value = "random_string.rand-str[*].result"
}





Execution of infrastrucutre 

init > plan > apply


terraform init 

This command  will scan  your tf file in that folder  and install all  the required automation things


terraform plan 

This command  will create  an execution plan  for terraforming  ,the things that will be installed ,the names,and the   properties added 

terraform apply

the acutual execution and automation happen  in this command 
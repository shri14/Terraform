Day 2 terrform

lets make  one terraform configration file called  main.tf where  we make resource  which is local file and name is devops (devops is resouce name)
add attribute filename = "/study/terraform/Day2/devops.txt" and content = "this is Day2 of terraform"

 terraform code look like 
  resource local_file "devops" {
    filename = "/study/terraform/Day2/devops.txt"
    content  = "this is Day2 of terraform"
  }
 then terraform init
 terraform plan
 terraform apply
 which created a file called devops.txt in the mention path

 Problam :
  now the what is the problem ?
  the problem is if i want to chnage the file name then i need to upadte main.tf file,the is one codding rule accoriding to codding rule never change files main directly; use configuration in  main files and modify configurations. those are  experience and working in industry they knows  whterver  things needs is in separate file and form there  things will import and upadte in main file 

    resource local_file "devops" {
    filename = "/study/terraform/Day2/devops.txt"
    content  = "this is Day2 of terraform"
  }

if  want to chnage we can change it here which is wrong  insted of we can create a vaiable 

variables:

A variable in Terraform is similar to a variable in programming. It is a container that holds a value and can represent different values at different times during the execution of a Terraform plan. Understanding how to use variables in Terraform is essential to creating dynamic and reusable infrastructure as code.

we can create  a variable.tf file which will hold all the variables 
 lets make a vairable  today  
 for vailable crate a vaiable.tf file  why we make this file ,in this file we can create all the variables ,when we do terraform init after terrform will understand okay all the variables are in the vairaibale.tf file and all the excucution things is in main.tf file 


So how to make variables 
variables block start with vairable after that vairable namme
vairable {} # this is variable block  so we need to give default value for vairable

variable "filename" {    # declare this varaible 
    default = "/study/terraform/Day2/devops_vairables.txt"   #initatlise the value 
 
}
variable "content" {
    default = "this is autogenrated from terraform variables"
}

these variables can be access   by var object in  main.tf 
     
now we have to aceess in main.tf

lets make new resouce in main.tf

resource "local_file" "devops_var"{
    filename = var.filename 
    content  = var.content



In the main.tf we have 2 resourecs 
one is without variable and second resource is with variable 
so whit is the diffrence betweeen both resorces

so lets check terraform plan

terraform says local_file.devops_var  will be created, content is  "this is autogenrated from terraform variables" which is  read form variable and  from var.file name read file name which is  devops_vairables1.txt

after that 

terraform apply 
 after apply 

 devops_vairables1.txt file will be created with the content in it which is defined in vairable.tf file



DATA types in terraform

COMPLEXT DATA TYPES 
Type = map

The map variable type is used to create variables holding key-value pair pairs. This allows you to add a list of named values in your Terraform configuration. Each value will be associated with a unique Key.
In the following 

variable "contentmap" {
    type = map
    default = {
        content1 = "this is cool contetnt1"
        content2 =  "this is great content"
    }
}

list

List variables are used to sequentially pass multiple elements to Terraform configuration. As an example,

variable "file_list" {
    type = list
    default = ["/study/terraform/Day2/file_1.txt" , "/study/terraform/Day2/file_2.txt"]

}

Bool
The Bool type is capable of holding either true or false values. For example, if we define the enable_logging variables as a type of bool with a value defaulting to true, the logging function will be enabled. You can change the default value from true to false to disable it.

variable "logging" {
  type	= bool
  default = true
} 

objects
The object variable allows you to create variables that contain structured data and named attributes. This is similar to a map but has fixed names and types for the attributes.

variable "aws_ec2_object" {
    type = object({
        name = string
        intstance = number 
        keys = list(string)
        ami = string

    })
    default = {
        name = "test_ec2_instances"
        intstances = 2
        keys = "keys1.pem" , "keys2.pem"
        ami = "amili1664"
    }
}


Set
Set variables allow you to define variables that hold an unordered set of unique values (i.e., no value is repeated). Sets can be useful when you don't care about the order and want to guarantee uniqueness.

For example, we can define a  security_groups variable as a set of strings.

variable "security_sg" {
  type	= set(string)
  default = ["sg-13224", "sg-3424EEW"]
}

Tuple
The tuple variable type allows you to define an ordered collection of elements. For example, we can define the network_addresses variable as a tuple of two strings.

variable "AP_addresses" {
  type	= tuple([string, string])
  default = ["192.168.20.10", "192.168.11.20"]
}



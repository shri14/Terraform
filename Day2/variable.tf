variable "filename" {
    default = "/study/terraform/Day2/devops.txt"
}

variable "content"{
    default = "this is autogenrated from terraform variables"
}


variable "contentmap" {
    type = map
    default = {
        content1 = "this is cool contetnt1"
        content2 =  "this is great content"
    }
}

variable "file_list1" {
    type = list
    default = ["/study/terraform/Day2/file_1.txt" ,"/study/terraform/Day2/file_2.txt"]

}
#user defined datatypes 
# variable "aws_ec2_object" {
#     type = object({
#         name = string
#         intstance = number 
#         keys = list(string)
#         ami = string

#     })
#     default = {
#         name = "test_ec2_instances"
#         intstances = 2
#         keys = "keys1.pem" , "keys2.pem"
#         ami = "amili1664"
#     }
# }
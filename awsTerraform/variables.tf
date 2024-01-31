variable "region" {
  description = "The region to deploy the resources into."
  type        = string
  default     = "ap-south-1"

}
variable "aws_instance" {
  description = "Details of AWS instance to be created."
  type = object({
    ami            = string, # ID of AMI to use for instance creation.
    instance_type  = string, # Type of EC2 Instance to launch
    key_name       = string
    instance_count = number # Corrected typo here
  })

  default = {
    ami            = "ami-03f4878755434977f"
    instance_type  = "t2.micro"
    key_name       = "websitekey"
    instance_count = 1
  }
}

variable "bucket" {
  description = "Name of S3 bucket to create and store data in."
  type        = string
  default     = "my-tf-test-bucket-2024"

}
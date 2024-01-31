    # Terraform With AWS

    Provisioning on AWS is quite easy and Straightforward with  Terraform.
    # - AWS Cli Installed 
        This Command Line Interface(AWS CLI) is a unified tool to manage your AWS services. With kust one tool to download and configure,you can control multiple AWS services from the command line and automate them through scripts 

    #   AWS IAM USER
        IAM , AWS identity and access management(IAM) is a web service 
        that helps you securely control access to AWS resource . You use IAM to control who is authenticated(signed is) and authorized (has permissions) to use resorces.


        In order to connect your AWS account and Terraform, you need the access keys and secret acess keys exported  to your machine 
        

        steps to be taken 

        install aws cli
        You can download form web or simply go the terminal and run the follwing command
        #sudo apt install awscli 
        give credentials  
        create iam user
        give any name   
        user name is  Terraform_user ,give programatic access which is used for AWS API, CLI 

        and give a  permission  (Administrator Access)
        you will get access key id and secret access key  and please download CSV file which is most imp 


    create a terraform-aws folder/Dirctory 
    go inside the Dirctory
    and run the command 
    # aws configure it will ask you far access key id paste access key id then it will ask for the ecret access key  paste it after that it will ask for  region enter your  preferd region  then lastly it will ask for format give JSON

    check aws  properly configured  or not for that run command # aws s3 ls if u get list of bucket that means aws is succesfully configured  

    As we tell awscli this my access key id and secret access key like same   we need to tell terraform this is my access key id and secret access key

    so how we gona tell terraform 
    we need to export keys and  secreat key 
    # export AWS_ACCESS_KEY_ID=<access key
    # export AWS_SECRET_ACCESS_KEY= <secret key>

    now all is configured 
    # Lets Get Started !
    lets create main.tf  inside this file we access aws 


    we need to make Terraform blog and inside the block we defined required providers:
        terraform {
            required_providers {
                aws = {
                    source = "hashicorp/aws"
                    version = "~> 4.16"
                }
            }
        required_version = ">= 1.2.0"
        }
    # above block is called terraform block


    provider "aws" {
        region = "ap-south-1"
    }
    # lets create a aws instance 

    # aws EC2 instance Provising 

    # craating instance is very easy when you know What resource & resource type  we need to use what provider we  need to use.

    resource "aws_instance" "instance" {
        ami           = "ami-0c94855ba937ecf"
        key = "key1"
        instance_type = "t2.micro"
        count = 2
        tags = {
            Name = "terraform-instance_example"
        }
    }
    # now if u want to see the public ip that we created in the out put for that we need output block  so lets create 
    output "public_ips" {
        value = aws_instance.instance.public_ip
    }
    # this code gives a error becouse our out is  aws_instance.instance.public_ip   that means one instance public ip  but we have mentions count 2 so for that we need arrry   i:e
    output "public_ips" {
        value = aws_instance.instanc[*]e.public_ip

    # AWS S3 Bucket 

    # lets create bucket using terraform
    resource "aws_s3_bucket" "aws2024" {
    bucket = "my-tf-test-bucket-2024"
    tags = {
        name        = "shrikar_bucket"
        Envioirment = "dev"
    }

    }
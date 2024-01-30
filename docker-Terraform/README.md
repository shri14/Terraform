# terraform with Docker 
# terraform needs to be told which provider to be used in the automation , hence we need to give the provider name with source and version
# For Docker ,we can use this block of code in main.tf

Terraform block
# anything which has name  after that  which is start and end  with curly bracket { } that is block 
terraform {

    required_providers {
        docker = {
            source  = "kreuzwerker/docker"
            version = "~>2.21.0"
        }
    }
}
provider "docker"{}

# Provider
# kreuzwerker/docker, is shorthand for registry.terraform.io/kreuzwerker/docker.
# Provider = The provider block configures the specified provider, in this case , A docker  is a plugin that terraform uses to create and manage resorces  , provider "docker" {}

# Resoruce 
# use resource block to define components of your infrastructure . A resource might be a physical or virtual component such as Docker container , or it can be a logical resource such as Heroke application

# Resource blocks have two strings before the block: the resource type and the resource name . in this example , the first resource type is docker_image and tag nane is Nginx

resource  "docker_image" "nginx" {   # in this example docker is provider and image is resorce  type and nginx is Resource name 
    name          = "nginx:latest"   #  in this exmaple  name =  is image name 
    keep_locally  = false            # wants to store locally flase means no
}

# there are 3 block  terraform block provider block  and resource block

resource "docker_continer" "nginx"{

    image = docker_image.nginx.latest    # in this line  where we make image in the  above resource block  which is docker_image and resorce name is nginx and version is latest
    name = nginxcon # container name 
    ports {
        internal = 80   #mapping port 
        external = 80   #mapping port
    }  
}

# excucute the code 
# terraform init
# terraform plan  # getting error becouse of docker is not installed in sever u need to install docker in sever 
# Incase docker is not installed 
sudo apt-get installed docker.io
sudo docker ps # to check docker is working or not
# chnage owenership give permision to user for docker.sock
sudo chown $USER /var/run/docker.sock
now docker can run without sudo 

# now check with terraform plan

validate the code with # terraform validate command 



provider "aws" {
    region = "us-east-1"
    profile = var.profile
}

resource "aws_instance" "rmq" {
    ami = "ami-07ebfd5b3428b6f4d"
    instance_type = "t2.micro"
    key_name = "rabbitmq"
    vpc_security_group_ids = ["sg-08e16d750d2602695"]

    tags = {
        Name = var.name
        Group = var.group
    }
}

variable "name" {
    description = "name the instance on deploy"
}

variable "group" {
    description = "The group name that ansible's dynamic inventory will groups"
}

variable "profile" {
    description = "Which profile to use for IAM"
}
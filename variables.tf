variable "region" {
    description = "The AWS region to create resource in"
    default = "eu-central-1" # Frankfurt region
}

variable "key_name" {
    description = "The name of the key pair"
    default = "julias_key_pair"
}

variable "ami_id" {
    description = "The ID of the AMI to use for the instance"
    default = "ami-08a34e890d3f70022"
}
variable "instance_type" {
    description = "The type of the instance"
    default = "t2.micro"
}

variable "bucket" {
    description = "The name of the bucket"
    default = "j.andrusenko-bucket"
}
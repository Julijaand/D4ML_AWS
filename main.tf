# Define the AWS provider and region
provider "aws" {
  region = var.region  
}

resource "aws_instance" "JA_client_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

user_data = file("C:/Users/julija.andrusenko/Desktop/projects/D4ML_AWS/upload_and_list.sh")

metadata_options {    
                http_tokens="required"    
                http_put_response_hop_limit="3"    
                http_endpoint="enabled"   
                }
}

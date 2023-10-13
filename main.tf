# Define the AWS provider and region
provider "aws" {
  region = var.region  
}

resource "aws_instance" "JA_client_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = <<-EOF
    #!/bin/bash
      tar -czvf /tmp/varlog.tar.gz /var/log/

      aws s3 cp /tmp/varlog.tar.gz s3://j.andrusenko-bucket/500mb_dir/

      rm /tmp/varlog.tar.gz

      aws s3 ls s3://j.andrusenko-bucket/500mb_dir/ > /tmp/uploaded_files.txt

      aws s3 cp /tmp/uploaded_files.txt s3://j.andrusenko-bucket/500mb_dir/

      INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
      aws ec2 terminate-instances --instance-ids $INSTANCE_ID --region eu-central-1
      EOF

  tags = {
  Name = "JA_client_instance"
}

metadata_options {    
                http_tokens="required"    
                http_put_response_hop_limit="3"    
                http_endpoint="enabled"   
                }
}

# Task:

As a junior DevOps engineer, you need to prove to your client that it is possible to upload 500MB of file from EC2 Instance to an S3 bucket and automate this procedure.

A client wants to know:

Which resources will be created during the procedure
How long will it take to upload a 500MB file from EC2 t2.micro to S3 bucket
Provide monitoring graph from AWS
What must be done:

Automate this procedure
Resource provision must be done by Terraform
Instead of a file, you need to automate the uploading of the entire /var/log/ directory
File with uploaded files list should be in S3 bucket as well
Afterward, the instance should be terminated automatically
IMDSv2 method must be used to retrieve instance data.

# Instructions:

A client wants to know:
# Which resources will be created during the procedure
During the procedure will be created the following resources:
- EC2 Instance (Virtual Machine) - JA_client_instance
- S3 Bucket (or you can use existing one) - j.andrusenko-bucket
- Uploaded Files to S3 bucket - varlog.tar.gz
- List of Uploaded Files - uploaded_files.txt


# How long will it take to upload a 500MB file from EC2 t2.micro to S3 bucket
Created Custom Metrics and checked with CloudWatch 

# Provide monitoring graph from AWS

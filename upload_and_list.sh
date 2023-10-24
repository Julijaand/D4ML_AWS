#!/bin/bash

START_TIME=$(date -u +%Y-%m-%dT%H:%M:%S)

tar -czvf /tmp/varlog.tar.gz /var/log/

aws s3 cp /tmp/varlog.tar.gz s3://j.andrusenko-bucket/500mb_dir/

rm /tmp/varlog.tar.gz

END_TIME=$(date -u +%Y-%m-%dT%H:%M:%S)
DURATION=$(( $(date -d $END_TIME +%s) - $(date -d $START_TIME +%s) ))

aws cloudwatch put-metric-data --metric-name "S3UploadDuration" --namespace "Custom" --value $DURATION --unit "Seconds"

# Generate a list of uploaded files
aws s3 ls s3://j.andrusenko-bucket/500mb_dir/ > /tmp/uploaded_files.txt

# Upload the list of uploaded files back to S3
aws s3 cp /tmp/uploaded_files.txt s3://j.andrusenko-bucket/500mb_dir/

# Terminate the EC2 instance
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
aws ec2 terminate-instances --instance-ids $INSTANCE_ID --region eu-central-1
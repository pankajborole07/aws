#1) Create key to connect aws_pem_key & aws_ppk_key
cd ~
aws ec2 create-key-pair --key-name aws_pem_key --query 'KeyMaterial' --output text > aws_pem_key.pem
##2)
aws ec2 create-security-group --group-name aws-experiments --description "This is for aws experiments"  =>    "GroupId": "sg-022ecee8625fbdb94"
#3) 
aws ec2 authorize-security-group-ingress --group-name aws-experiments --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name aws-experiments --protocol tcp --port 9200 --cidr 0.0.0.0/0

#4) Create ec2 instance with created security group and key 
# Ubuntu 20.0 : aws ec2 run-instances --image-id ami-0c7cb70d3eb61492b --security-group-ids aws-experiments --instance-type t2.micro --key-name aws_pem_key
# aws ec2 terminate-instances --instance-ids i-06f6e1f6184ed8de0
# AWS Linux: 
aws ec2 run-instances --image-id ami-0b8b7786ce75a2b4f --security-group-ids aws-experiments --instance-type t2.micro --key-name aws_pem_key
# Get Public IP to connect 
aws ec2 describe-instances --instance-ids i-0fbd22ff94451b8c2 --query 'Reservations[0].Instances[0].PublicIpAddress'
#  "18.182.46.223"


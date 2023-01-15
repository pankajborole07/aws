# Requirements 
Create AWS ec2 instace with amazon linux free tier 
Install prerequisute for Elastic Search
Installs ElasticSearch 
Configured to use credentials and provides encrypted communication
Validaton of ElasticSearch
Extend the solution with 3 nodes 

# Solutin in the form of Shell Script 

1) Create key to connect aws_pem_key & aws_ppk_key
cd ~
aws ec2 create-key-pair --key-name aws_pem_key --query 'KeyMaterial' --output text > aws_pem_key.pem
2) aws ec2 create-security-group --group-name aws-experiments --description "This is for aws experiments"  =>    "GroupId": "sg-022ecee8625fbdb94"
3) aws ec2 authorize-security-group-ingress --group-name aws-experiments --protocol tcp --port 22 --cidr 0.0.0.0/0

4) Create ec2 instance with created security group and key 
aws ec2 run-instances --image-id ami-0c7cb70d3eb61492b --security-group-ids aws-experiments --instance-type t2.micro --key-name aws_pem_key
aws ec2 describe-instances
aws ec2 describe-instances --instance-ids i-06f6e1f6184ed8de0 --query 'Reservations[0].Instances[0].PublicIpAddress'
chmod 600 aws_pem_key.pem
ssh -i aws_pem_key.pem ubuntu@54.250.203.168



# infrastructure
This repository basically creates a vpc with 2 public and 2 private subnets, where public subnet hosts two ec2 servers with jenkins and ansible server while in private subnet 2 docker instances are hosted

## Features
The module will create the majorly following AWS resources:
1. One route 53 record to route traffic from loylogic.jainankur2.info to application load balancer
2. One ALB which will target docker instances hosted in private subnet
3. One VPC with 2 public, 2 private subnets
4. One internet gateway, one netgateway
5. One jenkins ec2 instance (public subnet-1), Ansible ec2 instance (public subnet-2), docker ec2 instance (private subnet-1), docker ec2 instance (private subnet-2)
6. One alb security group, one security group for public subnet instances, one security group for private subnet instances

## Usage:
This can be used via cli using following command:
1. terraform init --backend-config=environement/dev.tfvars
2. terraform plan -var-file=environement/dev.tfvars
3. terraform apply -var-file=environement/dev.tfvars



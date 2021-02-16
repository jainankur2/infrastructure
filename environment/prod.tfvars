# Terraform state
bucket = "loylogic-prod"
key = "terraform_state/infrastructure/prod/terraform.tfstate"
region = "us-east-1"

#Environment information
account_environment = "prod"
availability_zones = [
  "us-east-1a",
  "us-east-1b"]

#EC2 instance vars"
ec2_instance_ami = "ami-03d315ad33b9d49c4"
#ec2_private_instance_ami = "ami-038389838877beb2e"
ec2_key_name = "loylogic-prod"

#route 53 details
dns_name = "loylogic-prod"
public_hosted_zone = "Z06663162RGEGP7NLC0F7"

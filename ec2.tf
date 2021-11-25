resource "aws_instance" "jenkins-instance" {
  ami           = var.ec2_instance_ami
  instance_type = "t2.small"
  vpc_security_group_ids = [
   "${aws_security_group.jenkins-instance-sg.id}" 
  ]
  key_name = var.ec2_key_name
  subnet_id = "${aws_subnet.public-subnet-1.id}"
  tags = {
    Name = format("loylogic-%s-jenkins-instance", var.account_environment)
  }

}

resource "aws_instance" "ansible-instance" {
  ami           = var.ec2_instance_ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [
   "${aws_security_group.ansible-instance-sg.id}"
  ]
  key_name = var.ec2_key_name
  subnet_id = "${aws_subnet.public-subnet-2.id}"
  tags = {
    Name = format("loylogic-%s-ansible-instance", var.account_environment)
  }

}

resource "aws_instance" "docker-instance-1" {
  ami           = var.ec2_instance_ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [
   "${aws_security_group.docker-instance-sg.id}"
  ]
  key_name = var.ec2_key_name
  subnet_id = "${aws_subnet.private-subnet-1.id}"
  tags = {
    Name = format("loylogic-%s-docker-instance-1", var.account_environment)
  }

}

resource "aws_instance" "docker-instance-2" {
  ami           = var.ec2_instance_ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [
   "${aws_security_group.docker-instance-sg.id}"
  ]
  key_name = var.ec2_key_name
  subnet_id = "${aws_subnet.private-subnet-2.id}"
  tags = {
    Name = format("loylogic-%s-docker-instance-2", var.account_environment)
  }

}


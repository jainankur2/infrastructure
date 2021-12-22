resource "aws_instance" "jenkins-instance" {
  ami           = var.ec2_instance_ami
  instance_type = "t2.small"
  vpc_security_group_ids = [
   "${aws_security_group.jenkins-instance-sg.id}" 
  ]
  key_name = var.ec2_key_name
  subnet_id = "${aws_subnet.public-subnet-1.id}"
  user_data = "${file("user_data//jenkins_configure.sh")}"
  tags = {
    Name = format("%s-%s-jenkins-instance", var.dns_name, var.account_environment)
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
  user_data = "${file("user_data//install_ansible.sh")}"
  tags = {
    Name = format("%s-%s-ansible-instance", var.dns_name, var.account_environment)
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
  user_data = "${file("user_data//install_docker.sh")}"
  tags = {
    Name = format("%s-%s-docker-instance-1", var.dns_name, var.account_environment)
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
  user_data = "${file("user_data//install_docker.sh")}"
  tags = {
    Name = format("%s-%s-docker-instance-2", var.dns_name, var.account_environment)
  }

}


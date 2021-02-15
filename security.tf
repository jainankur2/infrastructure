resource "aws_security_group" "jenkins-instance-sg" {
  vpc_id = "${aws_vpc.main.id}"
  name = format("loylogic-%s-jenkins-instance-sg", var.account_environment)
  description = "Jenkins instance access"
  egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh !
        // Do not do it in the production.
        // Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }
    //If you do not add this rule, you can not reach Login Jenkins
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

  tags = {
    Name = format("loylogic-%s-jenkins-instance-sg", var.account_environment)
  }
}

resource "aws_security_group" "docker-instance-sg" {
  vpc_id = "${aws_vpc.main.id}"
  name = format("loylogic-%s-docker-instance-sg", var.account_environment)
  description = "docker instance access"
  egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        // This means, all ip address are allowed to ssh !
        // Do not do it in the production.
        // Put your office or home address in it!
    }

  tags = {
    Name = format("loylogic-%s-docker-instance-sg", var.account_environment)
  }
}

resource "aws_security_group_rule" "docker-alb-sg-rule-80" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  source_security_group_id = aws_security_group.loylogic-ext-alb-sg.id
  security_group_id = aws_security_group.docker-instance-sg.id
}

resource "aws_security_group_rule" "docker-alb-sg-rule-8080" {
  type = "ingress"
  from_port = 8080
  to_port = 8080
  protocol = "tcp"
  source_security_group_id = aws_security_group.loylogic-ext-alb-sg.id
  security_group_id = aws_security_group.docker-instance-sg.id
}


resource "aws_security_group" "ansible-instance-sg" {
  vpc_id = "${aws_vpc.main.id}"
  name = format("loylogic-%s-ansible-instance-sg", var.account_environment)
  description = "Ansible instance access"
  egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh !
        // Do not do it in the production.
        // Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }

  tags = {
    Name = format("loylogic-%s-jenkins-instance-sg", var.account_environment)
  }
}

resource "aws_security_group" "loylogic-ext-alb-sg" {
  vpc_id = "${aws_vpc.main.id}"
  name = format("loylogic-%s-loylogic-ext-alb-sg-sg", var.account_environment)
  description = "Application load balancer instance access"
  egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    //If you do not add this rule, you can not reach Login Jenkins
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

  tags = {
    Name = format("loylogic-%s-loylogic-ext-alb-sg-sg", var.account_environment)
  }
}

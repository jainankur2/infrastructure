output "Jenkins-Server" {
  description = "Jenkins server Public IP"
  value = aws_instance.jenkins-instance.public_ip
}

output "Ansible-Server" {
  description = "Ansible server Public IP"
  value = aws_instance.ansible-instance.public_ip
}

output "Docker-Server1" {
  description = "Docker server1 Private IP"
  value = aws_instance.docker-instance-1.private_ip
}

output "Docker-Server2" {
  description = "Docker server2 Private IP"
  value = aws_instance.docker-instance-2.private_ip
}

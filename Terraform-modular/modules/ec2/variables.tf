variable "key_name" {
    default = "nouman"
}

variable "public_key_path" {
    default = "/home/muhammadnoumansaeed/.ssh/id_rsa.pub"
}

variable "ami" {
    default = "ami-07c8c1b18ca66bb07"
}

variable "instance_type" {
    default = "t3.small"
}

variable "subnet_id" {
  
}

variable "security_group_ids" {
  type = list(string)
}





variable "user_data" {
    default = <<-EOF
             #!/bin/bash
             sudo apt update
             sudo apt install default-jdk -y
             sudo rm /etc/apt/sources.list.d/jenkins.list

             curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

             echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

             sudo apt update
             sudo apt install jenkins -y
             sudo systemctl start jenkins

             # Install Docker
             sudo apt install docker.io -y
             sudo systemctl start docker
             sudo chown jenkins:jenkins /var/run/docker.sock
             sudo chmod 666 /var/run/docker.sock
             sudo usermod -aG docker ubuntu
             sudo chown jenkins:jenkins /var/run/docker.sock
             sudo systemctl restart jenkins
             sudo apt install docker-buildx


             # install unzip and install awscli
             sudo apt install unzip -y
             curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
             unzip awscliv2.zip
             sudo ./aws/install



             EOF
  
}
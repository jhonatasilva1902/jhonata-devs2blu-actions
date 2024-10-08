provider "aws" {
  region = "us-east-1"  # Escolha a região que preferir
}


resource "aws_security_group" "security_group_jhonata_actions" {
  name        = "security_group_jhonata_actions"
  description = "Security Group para SSH, HTTP e porta 8000"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "jhonata_vm_actions" {
  ami           = "ami-053b0d53c279acc90"  # AMI do Ubuntu 18.04
  instance_type = "t2.micro"  # Tipo de instância
  key_name      = aws_key_pair.keypair_jhonata_vm_actions.key_name   

  vpc_security_group_ids = [aws_security_group.security_group_jhonata_actions.id]


  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y software-properties-common
              sudo apt-add-repository --yes --update ppa:ansible/ansible
              sudo apt-get install -y ansible              
              EOF



  tags = {
    Name = "jhonata_vm_actions"
    Aluno = "jhonata"
    Environment = "dev"
    Application = "backend"
    Class = "DevOps"    
  }
}

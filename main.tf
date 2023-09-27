provider "aws" {
  region = "us-east-1"  # Substitua pela região desejada
}

resource "aws_security_group" "security_group_jhonata" {
  name        = "security-group-jhonata"
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
  ami           = "ami-053b0d53c279acc90"  # AMI do Ubuntu 18.04 (substitua pela AMI desejada)
  instance_type = "t2.micro"  # Tipo de instância (substitua pelo tipo desejado)
  key_name      = aws_key_pair.meu_keypair_jhonata.key_name

  vpc_security_group_ids = [aws_security_group.security_group_jhonata.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y software-properties-common
              sudo apt-add-repository --yes --update ppa:ansible/ansible
              sudo apt-get install -y ansible

              # Copia a chave SSH para o diretório do usuário
              echo "${file("~/.ssh/id_rsa.pub")}" >> ~/.ssh/authorized_keys
              chmod 600 ~/.ssh/authorized_keys
              EOF


  tags = {
    Name        = "jhonata_vm_actions"
    Environment = "dev"
    Application = "backend"
    Class       = "DevOps"
    Origem      = "Meu primeiro git actions"
  }
  
  key_name      = aws_key_pair.meu_keypair_jhonata.key_name
}
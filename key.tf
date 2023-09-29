# resource "aws_key_pair" "keypair_jhonata_vm_actions" {
#   key_name   = "meu-keypair-jhonata-actions"
#   public_key = "${file("~/.ssh/id_rsa.pub")}"

# }

# # Data Source para buscar a instância EC2 com base no nome da VM
# data "aws_instance" "my_instance" {
#   filter {
#     name   = "tag:Name"
#     values = ["jhonata_vm_actions"]
#   }
# }

# # Data Source para buscar a chave SSH com base no nome da keypair
# data "aws_key_pair" "my_keypair" {
#   key_name = "meu-keypair-jhonata-vm-actions"
#   public_key = data.aws_instance.existing_instance.public_key
# }

# # Data Source para buscar o grupo de segurança com base no nome
# data "aws_security_group" "my_security_group" {
#   name = "security-group-jhonata_actions"
# }
provider "aws" {
  region = "us-east-1"  # Substitua pela região desejada
}

variable "ec2_instance_name" {
  description = "Nome da instância EC2"
  default     = ""  # Deixe em branco para criar uma nova instância
}

variable "keypair_name" {
  description = "Nome da key pair"
  default     = ""  # Deixe em branco para criar uma nova key pair
}

variable "security_group_name" {
  description = "Nome do security group"
  default     = ""  # Deixe em branco para criar um novo security group
}

data "aws_instance" "existing_instance" {
  count = var.ec2_instance_name != "" ? 1 : 0
  tags = {
    Name = var.ec2_instance_name
  }
}

data "aws_key_pair" "existing_keypair" {
  count = var.keypair_name != "" ? 1 : 0
  key_name = var.keypair_name
}

data "aws_security_group" "existing_security_group" {
  count = var.security_group_name != "" ? 1 : 0
  name   = var.security_group_name
}

resource "aws_key_pair" "keypair_jhonata_vm_actions" {
  count = data.aws_key_pair.existing_keypair != [] ? 0 : 1
  key_name   = "meu-keypair-jhonata-actions"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "jhonata_vm_actions" {
  count = var.ec2_instance_name != "" ? 0 : 1

  ami           = "ami-053b0d53c279acc90"  # AMI do Ubuntu 18.04 (substitua pela AMI desejada)
  instance_type = "t2.micro"  # Tipo de instância (substitua pelo tipo desejado)
  key_name      = aws_key_pair.keypair_jhonata_vm_actions[0].key_name

  vpc_security_group_ids = [aws_security_group.security_group_jhonata_actions.id]

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
    Origem      = "Meu segundo git actions"
  }
}

resource "aws_security_group" "security_group_jhonata_actions" {
  count = var.security_group_name != "" ? 0 : 1
  name        = "security-group-jhonata_actions"
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

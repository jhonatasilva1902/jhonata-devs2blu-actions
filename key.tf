resource "aws_key_pair" "meu_keypair_jhonata_actions" {
  key_name   = "meu-keypair-jhonata-actions"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
  count      = data.aws_key_pair.existing_key ? 0 : 1
}

data "aws_key_pair" "existing_key" {
  key_name = aws_key_pair.meu_keypair_jhonata_actions[0].key_name
}

resource "aws_security_group" "security_group_jhonata_actions" {
  count = data.aws_security_group.existing_security_group.name != "" ? 0 : 1  # Cria apenas se não existir
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

data "aws_security_group" "existing_security_group" {
  name = aws_security_group.security_group_jhonata_actions.name
}
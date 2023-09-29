resource "aws_key_pair" "keypair_jhonata_vm_actions" {
  key_name   = "meu-keypair-jhonata-actions"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

}

# Data Source para buscar a instância EC2 com base no nome da VM
data "aws_instance" "my_instance" {
  filter {
    name   = "tag:Name"
    values = ["jhonata_vm_actions"]
  }
}

# Data Source para buscar a chave SSH com base no nome da keypair
data "aws_key_pair" "my_keypair" {
  key_name = "meu-keypair-jhonata-vm-actions"
}

# Data Source para buscar o grupo de segurança com base no nome
data "aws_security_group" "my_security_group" {
  name = "security-group-jhonata_actions"
}

resource "aws_key_pair" "keypair_jhonata_vm_actions" {
  key_name   = "meu-keypair-jhonata-vm-actions"
  public_key = data.aws_instance.existing_instance.public_key
}
# resource "aws_key_pair" "keypair_jhonata_vm_actions" {
#   key_name   = "keypair-jhonata-actions"
#   public_key = "${file("~/.ssh/id_rsa.pub")}"

# }

# # Data Source para buscar a instância EC2 com base no nome da VM
# data "aws_instance" "my_instance" {
#   filter {
#     name   = "tag:Name"
#     values = ["jhonata_vm_actions"]
#   }
# }
	

data "aws_instance" "existing_instance" {
  instance_id = "i-07a3d69be6e6995e7"
}

resource "aws_key_pair" "keypair_jhonata_vm_actions" {
  key_name   = "meu-keypair-jhonata-vm-actions"
}

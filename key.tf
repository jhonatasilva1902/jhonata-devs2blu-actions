resource "aws_key_pair" "keypair_jhonata_vm_actions" {
  key_name   = "meu-keypair-jhonata-actions"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

}


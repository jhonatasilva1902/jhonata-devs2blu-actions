resource "aws_key_pair" "meu_keypair_jhonata_actions" {
  key_name   = "meu-keypair-jhonata-actions"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

}


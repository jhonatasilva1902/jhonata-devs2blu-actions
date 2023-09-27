resource "aws_key_pair" "meu_keypair_jhonata_actions" {
  key_name   = "meu-keypair-jhonata-actions"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
  count      = data.aws_key_pair.existing_key ? 0 : 1
}

data "aws_key_pair" "existing_key" {
  key_name = aws_key_pair.meu_keypair_jhonata_actions[0].key_name
}
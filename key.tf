resource "aws_key_pair" "meu_keypair_jhonata_actions" {
  count      = var.create_key ? 1 : 0
  key_name   = "meu-keypair-jhonata-actions"
  public_key = file("~/.ssh/id_rsa.pub")
}

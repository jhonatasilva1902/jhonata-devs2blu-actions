resource "aws_key_pair" "meu_keypair_jhonata" {
  count      = var.create_key ? 1 : 0
  key_name   = "meu-keypair-jhonata"
  public_key = file("~/.ssh/id_rsa.pub")
}

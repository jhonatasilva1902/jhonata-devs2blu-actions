resource "aws_key_pair" "meu_keypair_jhonata" {
  key_name   = "meu-keypair-jhonata"
  public_key = file("${path.module}/id_rsa.pub")
}

output "instance_ip" {
  value = aws_instance.jhonata_vm_actions.public_ip
  description = "O IP público da instância EC2"
}
output "instance_id" {
  value = aws_instance.jhonata_vm_actions.id
}
output "instance_public_dns" {
  value = aws_instance.jhonata_vm_actions.public_dns
}




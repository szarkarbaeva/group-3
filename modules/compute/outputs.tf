output "public_ip" {
  value = aws_instance.group3.public_ip
}

output "sg_id" {
  value = aws_security_group.group3_sg.id
}
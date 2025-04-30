output "vpc_id" {
  value = aws_vpc.group3.id
}

output "subnet_ids" {
  value = aws_subnet.public[*].id
}
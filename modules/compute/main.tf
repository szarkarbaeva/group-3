resource "aws_key_pair" "group3_key" {
  key_name   = "group3-key"
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "group3_sg" {
  name   = "group-3"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.bastion_cidr]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "group3" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.group3_sg.id]
  key_name                    = aws_key_pair.group3_key.key_name
  user_data                   = file("${path.module}/../scripts/wordpress.sh")

  tags = { Name = "group-3" }
}
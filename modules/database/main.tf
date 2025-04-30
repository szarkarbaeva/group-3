resource "aws_db_subnet_group" "group3_subnet_group" {
  name       = "group3-db-subnet-group-new"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "group3_rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = var.engine_version
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = var.db_user
  password             = var.db_password
  skip_final_snapshot  = true
  publicly_accessible  = true
  db_subnet_group_name = aws_db_subnet_group.group3_subnet_group.name
  vpc_security_group_ids = [var.sg_id]
}
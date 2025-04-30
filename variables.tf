variable "aws_region"       { default = "us-east-1" }
variable "vpc_cidr"         { default = "10.0.0.0/16" }
variable "azs"              { default = ["us-east-1a", "us-east-1b", "us-east-1c"] }
variable "ami_id"           { default = "ami-0f9de6e2d2f067fca" }
variable "instance_type"    { default = "t2.micro" }
variable "public_key_path"  { default = "~/.ssh/id_rsa.pub" }
variable "bastion_cidr"     { default = "0.0.0.0/0" }
variable "db_name"          { default = "wordpress" }
variable "db_user"          { default = "Kaizen" }
variable "db_password"      {}
variable "db_instance_class"{}
variable "engine_version"   {}
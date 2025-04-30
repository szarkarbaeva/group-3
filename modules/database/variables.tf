variable "subnet_ids" {
  type = list(string)
}

variable "sg_id" {
  type  = string
}
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "engine_version" {
  type    = string
  default = "8.0.35" 
}
output "wordpress_url" {
  value = "http://${module.compute.public_ip}"
}

output "rds_endpoint" {
  value = module.database
}
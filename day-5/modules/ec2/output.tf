output "ip_addresses" {
  value = [for instance in aws_instance.k8s : instance.public_ip]
}

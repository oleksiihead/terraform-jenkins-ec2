output "vpc_id" {
  description = ""
  value       = aws_vpc.vpc.id
}

output "instance_public_ip" {
  description = ""
  value       = aws_instance.ec2_vm.*.public_ip
}

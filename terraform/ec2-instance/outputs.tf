output "vpc_id" {
  description = "VPD id"
  value       = aws_vpc.vpc.id
}

output "instance_public_ip" {
  description = "Public IP address of EC2 instance"
  value       = aws_instance.ec2_vm.*.public_ip
}

#output "all-vpcs-ids" {
#  value = data.aws_vpcs.all-vpcs.ids
#}

output "vpc_id" {
  description = ""
  value       = data.aws_vpc.current_vpc.id
}

output "instance_public_ip" {
  description = ""
  value       = aws_instance.ec2_vm.*.public_ip
}

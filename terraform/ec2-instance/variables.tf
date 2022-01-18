variable "cred_file" {
  type        = string
  description = "Path to shared credentials file"
}

variable "region" {
  type        = string
  description = "Default region"
}

variable "sec_group_name" {
  type        = string
  description = "Name of security group"
}

variable "env_prefix" {
  type        = string
  description = "Environment prefix"
  default     = "dev"
}

variable "proj_name" {
  type        = string
  description = "Project prefix"
}

variable "default_cidr_block" {
  type        = string
  description = "Default cidr block"
}

variable "my_ip" {
  type        = string
  description = "My public IP for ssh access"
}

variable "ssh_public_key_name" {
  type        = string
  description = "AWS public key name"
}

variable "public_key" {
  type        = string
  description = "AWS pre-generated public key"
}

variable "ec2_instance_type" {
  type        = string
  description = "AWS instance type"
}

variable "private_key" {
  type        = string
  description = "AWS pre-generated private key"
}

variable "instance_user" {
  type        = string
  description = "User for SSH access"
}

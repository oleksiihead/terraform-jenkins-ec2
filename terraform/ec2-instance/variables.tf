variable "cred_file" {
  type        = string
  description = "Path to shared credentials file"
}

variable "region" {
  type        = string
  description = "Default region"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC cidr block"
}

variable "subnet_count" {
  type        = number
  description = "Desired number of subnets"
}

variable "subnet_cidr_blocks" {
  type        = list(string)
  description = "Subnet cidr block"
}

variable "available_zone" {
  type        = string
  description = "Availability zone"
}

variable "route_table_cidr_block" {
  type        = string
  description = "Route table cidr block"
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

variable "github_owner" {
  type        = string
  default     = "oleksiihead"
  description = "GitHub owner"
}

variable "github_token" {
  type        = string
  description = "GitHub token"
}

variable "repo_name" {
  type        = string
  description = "Repository name"
}

variable "repo_visibility" {
  type        = string
  description = "Repository visibility"
}

variable "webhook_events" {
  type        = list(string)
  description = "GitHub events for webhook"
}

variable "webhook_url" {
  type        = string
  description = "Webhook URL"
}

variable "content_type" {
  type        = string
  description = "Content type"
}

variable "ami_id" {
  description = "AMI ID for the instances"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "backend_private_ip" {
  description = "Private IP for Backend instance"
  type        = string
}

variable "ai_private_ip" {
  description = "Private IP for AI instance"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

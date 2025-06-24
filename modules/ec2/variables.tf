variable "vpc_id" {
  description = "VPC ID to attach EC2 security group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch EC2 instance"
  type        = string
}

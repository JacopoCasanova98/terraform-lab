variable "vpc_id" {
  type = string
}

variable "admin_cidr" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "instance_profile_name" {
  description = "nome dell'Instance Profile IAM associato all'istanza EC2"
  type        = string
}
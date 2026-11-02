variable "project_name" {
  type    = string
  default = "TaskFlow"
}

variable "replicas" {
  type    = number
  default = 3
}

variable "enabled" {
  type    = bool
  default = true
}

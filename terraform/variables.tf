 variable "location" {
  type    = string
  default = "eastus"
}

variable "resource_group" {
  type    = string
  default = "devops-demo-rg"
}

variable "container_group_name" {
  type    = string
  default = "devops-demo-cg"
}

variable "image" {
  type = string
}

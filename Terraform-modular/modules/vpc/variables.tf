variable "cidr_block" {
    type = string
    default = "11.0.0.0/16"
}


variable "public_subnet_cidr" {
  type = string
  default = "11.0.1.0/24"
}

variable "private_subnet_cidr" {
  type = string
  default = "11.0.2.0/24"
}

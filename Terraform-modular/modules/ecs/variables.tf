variable "cluster_name" {
    default = "noumancluster"
  
}

variable "service_name" {
    default = "django_app_service"
}

variable "task_definition_arn" {
    type = string
}

variable "desired_count" {
    type = number
    default = 1
  
}


variable "subnets" {
    type = list(string)
}

variable "security_groups" {
    type = list(string)
  
}
variable "env" {
  type        = string
  description = "This is var for Environment"
  default     = "dev"
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "project" {
  type    = string
  default = "cat"
}
variable "stage" {
  type    = string
  default = "nonprod"
}
variable "i_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}
//for vpc DEV
variable "vpc_cidr_dev" {
  type        = string
  description = "cidr for vpc"
  default     = "10.0.0.0/16"
}
variable "cidr_pubs_dev" {
  type        = list(string)
  description = "cidr for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
variable "cidr_privs_dev" {
  type        = list(string)
  description = "cidr for private subnets"
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}
variable "vpc_cidr_qa" {
  type        = string
  description = "cidr for vpc"
  default     = "11.0.0.0/16"
}
variable "cidr_pubs_qa" {
  type        = list(string)
  description = "cidr for public subnets"
  default     = ["11.0.1.0/24", "11.0.2.0/24", "11.0.3.0/24"]
}
variable "cidr_privs_qa" {
  type        = list(string)
  description = "cidr for private subnets"
  default     = ["11.0.11.0/24", "11.0.12.0/24", "11.0.13.0/24"]
}
variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}


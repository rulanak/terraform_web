variable "env" {
  type        = string
  description = "environment"
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
variable "instance_type" {
  type        = string
  description = "the size of EC2 instance"
  default     = "t2.micro"
}
variable "max_size" {
  type        = number
  description = "max size of instances"
  default     = 5
}
variable "min_size" {
  type        = number
  description = "min size of instances"
  default     = 2
}
variable "desired_capacity" {
  type        = number
  description = "desired capacity of instances"
  default     = 2
}
variable "force_delete" {
  type        = bool
  description = "if its true, it will delete ec2 if u delete asg. false - will no"
  default     = true

}
variable "ingress_ports" {
  type        = list(string)
  description = "list for ingress ports for sg"
  default     = ["22", "80"]
}
variable "ingress_cidrs" {
  type        = list(string)
  description = "cidrs for ingress ports"
  default     = ["44.212.71.220/32", "0.0.0.0/0"]
}

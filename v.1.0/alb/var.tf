variable "env" {
  type        = string
  description = "environment"
  default     = "dev"
}
variable "app_port" {
  type    = number
  default = 80
}
variable "vpc_dev" {
  type        = string
  description = "this vpc id is for dev env"
  default     = "vpc-0872b6d33b5e120e6"
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
  default     = ["443", "80"]
}
variable "ingress_cidrs" {
  type        = list(string)
  description = "cidrs for ingress ports"
  default     = ["0.0.0.0/0", "0.0.0.0/0"]
}

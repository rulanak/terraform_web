data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
data "template_file" "user_data" {
  template = file("user_data.sh")
  vars = {
    env = var.env
  }
}
data "aws_vpc" "vpc" {
  id = var.vpc_dev
}
data "aws_subnets" "subnets" {
filter {
    name   = "vpc-id"
    values = [var.vpc_dev]
  }
}
data "aws_subnet" "subnet" {
  for_each = { for index, subnetid in data.aws_subnets.subnets.ids : index => subnetid }
  id       = each.value
}

output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.subnet : s.cidr_block]
}
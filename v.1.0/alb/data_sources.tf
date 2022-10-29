data "aws_vpc" "vpc" {
  id = var.vpc_dev
}
data "aws_subnets" "subnets_dev" {
filter {
    name   = "vpc-id"
    values = [var.vpc_dev]
  }
}
data "aws_subnet" "subnet_dev" {
  for_each = { for index, subnetid in data.aws_subnets.subnets_dev.ids : index => subnetid }
  id       = each.value
}

output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.subnet_dev : s.cidr_block]
}
data "aws_autoscaling_group" "asg_dev" {
  name = "aws-us-east-1-nonprod-dev-cat-asg"
}
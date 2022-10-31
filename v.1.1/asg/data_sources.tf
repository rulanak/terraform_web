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
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "aws-terraform-backend-lana"
    key    = "session-web/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

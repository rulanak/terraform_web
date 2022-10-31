data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "aws-terraform-backend-lana"
    key    = "session-web/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
data "terraform_remote_state" "asg" {
  backend = "s3"
  config = {
    bucket = "aws-terraform-backend-lana"
    key    = "session-web/asg/terraform.tfstate"
    region = "us-east-1"
  }
}
terraform {
  backend "s3" {
    bucket         = "aws-terraform-backend-lana"
    key            = "session-web/alb/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-table-lana"
  }
}
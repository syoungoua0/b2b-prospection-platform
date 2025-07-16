terraform {
  required_version = ">= 1.1"
  backend "s3" {
    bucket = "tf-state-b2b-prospection"
    key    = "infra/terraform.tfstate"
    region = var.aws_region
    encrypt = true
  }
}
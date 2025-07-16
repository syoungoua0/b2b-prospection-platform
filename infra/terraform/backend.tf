terraform {
  required_version = ">= 1.1"
  backend "s3" {
    bucket = "tf-state-b2b-prospection"
    key    = "infra/terraform.tfstate"
    region = "eu-west-3"   # Remplace ici par la région exacte (ex: eu-west-3 pour Paris)
    encrypt = true
  }
}
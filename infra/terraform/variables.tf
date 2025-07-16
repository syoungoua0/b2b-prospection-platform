variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS"
  type        = list(string)
  # To retrieve your subnet IDs, you can use the AWS CLI:
  # aws ec2 describe-subnets --filters Name=vpc-id,Values=<YOUR_VPC_ID> --query 'Subnets[].SubnetId' --output text
  # Or find them in the AWS Console under VPC > Subnets.
}
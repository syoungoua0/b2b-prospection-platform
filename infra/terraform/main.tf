provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.eks_assume.json
}

resource "aws_iam_role" "eks_node" {
  name = "eks-node-role"
  assume_role_policy = data.aws_iam_policy_document.eks_assume.json
}

data "aws_iam_policy_document" "eks_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["eks.amazonaws.com", "ec2.amazonaws.com"]
    }
  }
}

resource "aws_eks_cluster" "b2b" {
  name     = "b2b-prospection-cluster"
  role_arn = aws_iam_role.eks_cluster.arn
  vpc_config {
    subnet_ids = var.subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
  }
}

resource "aws_eks_node_group" "workers" {
  cluster_name    = aws_eks_cluster.b2b.name
  node_group_name = "workers"
  node_role_arn   = aws_iam_role.eks_node.arn
  subnet_ids      = var.subnet_ids
  scaling_config {
    desired_size = 3
    max_size     = 6
    min_size     = 1
  }
}
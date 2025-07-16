output "kubeconfig" {
  description = "Kubernetes config for EKS cluster"
  value       = aws_eks_cluster.b2b.endpoint
}

output "cluster_ca" {
  description = "Certificate authority data"
  value       = aws_eks_cluster.b2b.certificate_authority[0].data
}

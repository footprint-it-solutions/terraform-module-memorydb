output "arn" {
  description = "The ARN of the MemoryDB cluster"
  value       = aws_memorydb_cluster.this.arn
}

output "id" {
  description = "The ID of the MemoryDB cluster"
  value       = aws_memorydb_cluster.this.id
}

output "cluster_endpoint_address" {
  description = "The DNS hostname of the cluster configuration endpoint"
  value       = aws_memorydb_cluster.this.cluster_endpoint.address
}

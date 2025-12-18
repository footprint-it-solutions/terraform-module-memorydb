output "arn" {
  description = "The ARN of the MemoryDB cluster"
  value       = aws_memorydb_cluster.this.arn
}

output "name" {
  description = "The name of the MemoryDB cluster"
  value       = aws_memorydb_cluster.this.name
}

output "primary_endpoint_address" {
  description = "The primary endpoint address of the MemoryDB cluster"
  value       = aws_memorydb_cluster.this.primary_endpoint_address
}

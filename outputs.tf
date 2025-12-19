output "arn" {
  description = "The ARN of the MemoryDB cluster"
  value       = aws_memorydb_cluster.this.arn
}

output "id" {
  description = "The ID of the MemoryDB cluster"
  value       = aws_memorydb_cluster.this.id
}

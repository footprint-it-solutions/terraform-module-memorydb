variable "acl_name" {
  description = "The name of the MemoryDB ACL"
  type        = string
  default     = "open-access"
}

variable "allowed_security_group_id" {
  description = "The security group ID that is allowed to access the MemoryDB cluster"
  type        = string
}

variable "auto_minor_version_upgrade" {
  description = "When set to true, the cluster will automatically receive minor engine version upgrades after launch."
  type        = bool
  default     = true
}

variable "engine_version" {
  description = "Version number of the engine to be used for the cluster."
  type        = string
  default     = "7.1"
}

variable "name" {
  description = "Name for the MemoryDB cluster and associated resources"
  type        = string
}

variable "node_type" {
  description = "The node type for the MemoryDB cluster"
  type        = string
  default     = "db.t4g.small"
}

variable "num_replicas_per_shard" {
  description = "The number of replicas per shard in the MemoryDB cluster"
  type        = number
  default     = 1
}

variable "num_shards" {
  description = "The number of shards in the MemoryDB cluster"
  type        = number
  default     = 1
}

variable "port" {
  description = "The port number on which each of the cache nodes will accept connections."
  type        = number
  default     = 6379
}

variable "snapshot_retention_limit" {
  description = "The number of days for which MemoryDB retains automatic snapshots before deleting them."
  type        = number
  default     = 7
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the MemoryDB subnet group"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "tls_enabled" {
  description = "Whether to enable TLS for the Memory.DB cluster"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "The ID of the VPC where the MemoryDB cluster will be deployed"
  type        = string
}

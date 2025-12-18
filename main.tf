resource "aws_security_group" "memorydb" {
  description = "Security group for MemoryDB cluster"
  name        = "${var.name}-memorydb"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.port
    protocol        = "tcp"
    security_groups = [var.allowed_security_group_id]
    to_port         = var.port
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  tags = merge(local.tags, {
    Name = "${var.name}-memorydb"
  })
}

resource "aws_memorydb_subnet_group" "this" {
  name       = "${var.name}-sng"
  subnet_ids = var.subnet_ids

  tags = merge(local.tags, {
    Name = "${var.name}-sng"
  })
}

resource "aws_memorydb_acl" "this" {
  count = var.acl_name == "open-access" ? 0 : 1
  name  = var.acl_name

  tags = merge(local.tags, {
    Name = var.acl_name
  })
}

resource "aws_memorydb_cluster" "this" {
  acl_name                 = var.acl_name == "open-access" ? var.acl_name : aws_memorydb_acl.this[0].name
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  engine_version           = var.engine_version
  name                     = var.name
  node_type                = var.node_type
  num_replicas_per_shard   = var.num_replicas_per_shard
  num_shards               = var.num_shards
  port                     = var.port
  security_group_ids       = [aws_security_group.memorydb.id]
  snapshot_retention_limit = var.snapshot_retention_limit
  subnet_group_name        = aws_memorydb_subnet_group.this.name
  tags                     = local.tags
  tls_enabled              = var.tls_enabled
}

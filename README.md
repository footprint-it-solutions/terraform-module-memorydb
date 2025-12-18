# Terraform AWS MemoryDB Module

This Terraform module deploys an Amazon MemoryDB for Redis cluster. It is designed to be a flexible and reusable component for your infrastructure.

## Usage

Here is an example of how to use this module to create a MemoryDB cluster:

```hcl
module "memorydb" {
  source = "./"

  name        = "my-memorydb-cluster"
  vpc_id      = "vpc-12345678"
  subnet_ids  = ["subnet-11111111", "subnet-22222222"]
  allowed_security_group_id = "sg-abcdefgh"

  node_type              = "db.r6g.large"
  num_shards             = 2
  num_replicas_per_shard = 1

  tags = {
    Environment = "production"
    Project     = "my-project"
  }
}
```

## Inputs

| Name                        | Description                                                      | Type          | Default         | Required |
| --------------------------- | ---------------------------------------------------------------- | ------------- | --------------- | :------: |
| `name`                      | Name for the MemoryDB cluster and associated resources.          | `string`      | n/a             |   yes    |
| `tags`                      | A map of tags to assign to the resources.                        | `map(string)` | `{}`            |    no    |
| `vpc_id`                    | The ID of the VPC where the MemoryDB cluster will be deployed.   | `string`      | n/a             |   yes    |
| `subnet_ids`                | A list of subnet IDs for the MemoryDB subnet group.              | `list(string)`| n/a             |   yes    |
| `allowed_security_group_id` | The security group ID that is allowed to access the cluster.     | `string`      | n/a             |   yes    |
| `auto_minor_version_upgrade`| When set to true, the cluster will automatically receive minor engine version upgrades after launch. | `bool` | `true` | no |
| `engine_version`            | Version number of the engine to be used for the cluster.         | `string`      | `"7.1"`         |    no    |
| `node_type`                 | The node type for the MemoryDB cluster.                          | `string`      | `"db.t4g.small"`|    no    |
| `num_shards`                | The number of shards in the MemoryDB cluster.                    | `number`      | `1`             |    no    |
| `num_replicas_per_shard`    | The number of replicas per shard in the MemoryDB cluster.        | `number`      | `1`             |    no    |
| `port`                      | The port number on which each of the cache nodes will accept connections. | `number` | `6379` | no |
| `snapshot_retention_limit`  | The number of days for which MemoryDB retains automatic snapshots before deleting them. | `number` | `7` | no |
| `acl_name`                  | The name of the MemoryDB ACL. If you wish to use an existing ACL, such as the default `open-access` ACL, provide its name. If you wish to create a new ACL, provide a new unique name. | `string`      | `"open-access"` |    no    |
| `tls_enabled`               | Whether to enable TLS for the MemoryDB cluster.                  | `bool`        | `true`          |    no    |

## Outputs

| Name                       | Description                                           |
| -------------------------- | ----------------------------------------------------- |
| `arn`                      | The ARN of the MemoryDB cluster.                      |
| `name`                     | The name of the MemoryDB cluster.                     |
| `primary_endpoint_address` | The primary endpoint address of the MemoryDB cluster. |

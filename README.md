<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/opsd-io/terraform-module-template/main/.github/img/opsd-github-repo-dark-mode.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/opsd-io/terraform-module-template/main/.github/img/opsd-github-repo-light-mode.svg">
  <img alt="OPSd - the unique and effortless way of managing cloud infrastructure." src="https://raw.githubusercontent.com/opsd-io/terraform-module-template/update-tools/.github/img/opsd-github-repo-light-mode.svg" width="400">
</picture>

Meet **OPSd**. The unique and effortless way of managing cloud infrastructure.

# terraform-module-template

## Introduction

What does the module provide?

## Usage

```hcl
module "terraform-module-digitalocean-postgresql" {



  cluster_name          = "example-postgresql-cluster"
  engine                = "pg"
  postgresql_version    = "11"
  node_size             = "db-s-1vcpu-1gb"
  region                = "nyc1"
  node_count            = 1
  common_tags           = ["production"]
  database_users        = ["Admin", "Mark", "Robert"]
  firewall_rules        = ["192.168.0.1", "192.168.0.2", "192.168.0.8"]
}
```

**IMPORTANT**: Make sure not to pin to master because there may be breaking changes between releases.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | 2.34.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.34.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_database_cluster.main](https://registry.terraform.io/providers/digitalocean/digitalocean/2.34.1/docs/resources/database_cluster) | resource |
| [digitalocean_database_firewall.main](https://registry.terraform.io/providers/digitalocean/digitalocean/2.34.1/docs/resources/database_firewall) | resource |
| [digitalocean_database_firewall.replica_fw](https://registry.terraform.io/providers/digitalocean/digitalocean/2.34.1/docs/resources/database_firewall) | resource |
| [digitalocean_database_replica.replica_main](https://registry.terraform.io/providers/digitalocean/digitalocean/2.34.1/docs/resources/database_replica) | resource |
| [digitalocean_database_user.main](https://registry.terraform.io/providers/digitalocean/digitalocean/2.34.1/docs/resources/database_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the database cluster. | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A list of tag names to be applied to the database cluster | `set(string)` | n/a | yes |
| <a name="input_database_users"></a> [database\_users](#input\_database\_users) | List of users | `set(string)` | `[]` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | List of trusted sources associated with the cluster | `set(string)` | `[]` | no |
| <a name="input_firewall_rules_replica"></a> [firewall\_rules\_replica](#input\_firewall\_rules\_replica) | List of trusted sources associated with the replica cluster | `set(string)` | `[]` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Number of mysql nodes that will be created. | `number` | `1` | no |
| <a name="input_node_size"></a> [node\_size](#input\_node\_size) | The mysql node instance size. | `string` | `"db-s-1vcpu-1gb"` | no |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | Engine version used by the cluster. | `number` | `16` | no |
| <a name="input_region"></a> [region](#input\_region) | DigitalOcean region where the cluster will reside. | `string` | n/a | yes |
| <a name="input_replica_cluster_name"></a> [replica\_cluster\_name](#input\_replica\_cluster\_name) | The name of the replica database cluster. | `string` | n/a | yes |
| <a name="input_replica_enable"></a> [replica\_enable](#input\_replica\_enable) | Flag to control the replica creation. | `bool` | `false` | no |
| <a name="input_replica_node_size"></a> [replica\_node\_size](#input\_replica\_node\_size) | The redis replica node instance size. | `string` | `"db-s-1vcpu-1gb"` | no |
| <a name="input_replica_region"></a> [replica\_region](#input\_replica\_region) | DigitalOcean replica region where the cluster will reside. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_id"></a> [firewall\_id](#output\_firewall\_id) | A unique identifier for the firewall |
| <a name="output_main_default_database"></a> [main\_default\_database](#output\_main\_default\_database) | Name of the cluster's default database. |
| <a name="output_main_default_user"></a> [main\_default\_user](#output\_main\_default\_user) | Username for the cluster's default user. |
| <a name="output_main_default_user_password"></a> [main\_default\_user\_password](#output\_main\_default\_user\_password) | Password for the cluster's default user. |
| <a name="output_main_host"></a> [main\_host](#output\_main\_host) | Database cluster's hostname. |
| <a name="output_main_host_id"></a> [main\_host\_id](#output\_main\_host\_id) | The ID of the database cluster. |
| <a name="output_main_port"></a> [main\_port](#output\_main\_port) | Network port that the database cluster is listening on. |
| <a name="output_main_private_host"></a> [main\_private\_host](#output\_main\_private\_host) | Same as host, but only accessible from resources within the account and in the same region. |
| <a name="output_main_private_uri"></a> [main\_private\_uri](#output\_main\_private\_uri) | Same as uri, but only accessible from resources within the account and in the same region. |
| <a name="output_main_uri"></a> [main\_uri](#output\_main\_uri) | The full URI for connecting to the database cluster. |
| <a name="output_replica_uuid"></a> [replica\_uuid](#output\_replica\_uuid) | Replica UUID. |
| <a name="output_user_ids"></a> [user\_ids](#output\_user\_ids) | A unique identifier for database users |
<!-- END_TF_DOCS -->

## Examples of usage

Do you want to see how the module works? See all the [usage examples](examples).

## Related modules

The list of related modules (if present).

## Contributing

If you are interested in contributing to the project, see see our [guide](https://github.com/opsd-io/contribution).

## Support

If you have a problem with the module or want to propose a new feature, you can report it via the project's (Github) issue tracker.

If you want to discuss something in person, you can join our community on [Slack](https://join.slack.com/t/opsd-community/signup).

## License

[Apache License 2.0](LICENSE)

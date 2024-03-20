module "Digitalocean_postgresql" {
  source                     = "github.com/opsd-io/terraform-module-digitalocean-postgresql?ref=2-create-postgresql-terraform-module"
  databasename               = "example-postgresql-cluster"
  engine                     = "pg"
  version_of_engine          = "11"
  postgresql_main_size       = "db-s-1vcpu-1gb"
  region                     = "nyc1"
  postgresql_main_node_count = 1
  common_tags                = ["production"]
  database_users             = ["Admin", "Mark", "Robert"]
  firewall_rules             = ["192.168.0.1", "192.168.0.2", "192.168.0.8"]
}

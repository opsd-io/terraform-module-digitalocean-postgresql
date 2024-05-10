module "example" {
  source = "github.com/opsd-io/terraform-module-digitalocean-postgresql?ref=changing_variables"

  cluster_name       = "example-postgresql-cluster"
  postgresql_version = "16"
  node_size          = "db-s-1vcpu-1gb"
  region             = "nyc1"
  node_count         = 1
  common_tags        = ["production"]
  database_users     = ["Admin", "Mark", "Robert"]
  firewall_rules     = ["192.168.0.1", "192.168.0.2", "192.168.0.8"]
  replica_enable     = false
  # replica_node_size      = "db-s-1vcpu-1gb"
  # replica_cluster_name   = "example-postgresql-replica-cluster"
  # replica_region         = "nyc1"
  # replica_firewall_rules = ["172.168.0.1", "172.168.0.2", "172.168.0.8"]
}

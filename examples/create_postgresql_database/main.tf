module "postgresql" {
  source = "https://github.com/opsd-io/terraform-module-digitalocean-postgresql?ref=main"

  cluster_name       = "opsd-main"
  postgresql_version = "16"
  node_size          = "db-s-1vcpu-1gb"
  region             = "nyc1"
  node_count         = 1
  common_tags        = ["production"]
  database_users     = ["Admin", "Mark", "Robert"]
  firewall_rules = [
    {
      type  = "ip_addr"
      value = "172.168.0.1"
    },
    {
      type  = "tag"
      value = "app"
    }
  ]
  replica_enable    = true
  replica_node_size = "db-s-1vcpu-1gb"
  replica_region    = "nyc1"
  replica_firewall_rules = [
    {
      type  = "ip_addr"
      value = "172.168.0.1"
    },
    {
      type  = "tag"
      value = "app"
    }
  ]
}

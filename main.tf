resource "digitalocean_database_postgresql_config" "postgresql_main" {
  cluster_id        = digitalocean_database_cluster.postgresql_main.id
  connect_timeout   = 10
  default_time_zone = "UTC"
}

#---------------------------------------------#
#Description : adding database firewall rules.
#---------------------------------------------#
resource "digitalocean_database_firewall" "firewall" {
  for_each   = var.firewall_rules
  cluster_id = digitalocean_database_cluster.postgresql_main.id

  dynamic "rule" {
    for_each = var.firewall_rules
    content {
      type  = "ip_addr"
      value = rule.value
    }
  }
}
#---------------------------------------------#
#Description : adding users to database.
#---------------------------------------------#
resource "digitalocean_database_user" "user" {
  for_each   = var.database_users
  cluster_id = digitalocean_database_cluster.postgresql_main.id
  name       = each.key
}
#---------------------------------------------#
#Description : creating main database.
#---------------------------------------------#
resource "digitalocean_database_cluster" "postgresql_main" {
  name       = var.databasename
  engine     = var.engine
  version    = var.version_of_engine
  size       = var.postgresql_main_size
  region     = var.region
  node_count = var.postgresql_main_node_count
  tags       = var.common_tags
}

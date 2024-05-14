terraform {
  required_version = ">= 1.5.5"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.34.1"
    }
  }
}

resource "digitalocean_database_cluster" "main" {
  name       = var.cluster_name
  engine     = "pg"
  version    = var.postgresql_version
  size       = var.node_size
  region     = var.region
  node_count = var.node_count
  tags       = var.common_tags
}

resource "digitalocean_database_firewall" "main" {
  cluster_id = digitalocean_database_cluster.main.id

  dynamic "rule" {
    for_each = var.firewall_rules
    content {
      type  = "ip_addr"
      value = rule.value
    }
  }
}

resource "digitalocean_database_firewall" "replica_fw" {
  count      = var.replica_enable ? 1 : 0
  cluster_id = join("", digitalocean_database_replica.main[*].uuid)
  dynamic "rule" {
    for_each = var.replica_firewall_rules
    content {
      type  = "ip_addr"
      value = rule.value
    }
  }
  depends_on = [digitalocean_database_replica.main]
}

resource "digitalocean_database_user" "main" {
  for_each   = var.database_users
  cluster_id = digitalocean_database_cluster.main.id
  name       = each.key
}

resource "digitalocean_database_replica" "main" {
  count      = var.replica_enable ? 1 : 0
  cluster_id = digitalocean_database_cluster.main.id
  name       = var.replica_cluster_name != null ? var.replica_cluster_name : "${var.cluster_name}-replica"
  size       = var.replica_node_size
  region     = var.replica_region
}

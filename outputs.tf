output "main_host_id" {
  description = "The ID of the database cluster."
  value       = digitalocean_database_cluster.main.id
}

output "main_host" {
  description = "Database cluster's hostname."
  value       = digitalocean_database_cluster.main.host
}

output "main_private_host" {
  description = "Same as host, but only accessible from resources within the account and in the same region."
  value       = digitalocean_database_cluster.main.private_host
}

output "main_port" {
  description = "Network port that the database cluster is listening on."
  value       = digitalocean_database_cluster.main.port
}

output "main_uri" {
  description = "The full URI for connecting to the database cluster."
  sensitive   = true
  value       = digitalocean_database_cluster.main.uri
}

output "main_private_uri" {
  description = "Same as uri, but only accessible from resources within the account and in the same region."
  sensitive   = true
  value       = digitalocean_database_cluster.main.private_uri
}

output "main_default_database" {
  description = "Name of the cluster's default database."
  value       = digitalocean_database_cluster.main.database
}

output "main_default_user" {
  description = "Username for the cluster's default user."
  value       = digitalocean_database_cluster.main.user
}

output "main_default_user_password" {
  description = "Password for the cluster's default user."
  sensitive   = true
  value       = digitalocean_database_cluster.main.password
}

output "firewall_id" {
  description = "A unique identifier for the firewall."
  value       = digitalocean_database_firewall.main.id
}

output "user_ids" {
  description = "A unique identifier for database users."
  value       = [for id in var.database_users : digitalocean_database_user.main[id].id]
}

output "database_cluster_urn" {
  description = "The uniform resource name of the database cluster."
  value       = digitalocean_database_cluster.main.urn
}

output "replica_uuid" {
  description = "Replica UUID."
  value       = digitalocean_database_replica.main[*].uuid
}

output "replica_id" {
  description = "Replica ID."
  value       = digitalocean_database_replica.main[*].id
}

output "user_password" {
  value = {
    for p, user in digitalocean_database_user.main : p => user.password
  }
  sensitive   = true
  description = "Password for the database user."
}

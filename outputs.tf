output "postgresql_main_host_id" {
  description = "The ID of the database cluster."
  value       = digitalocean_database_cluster.postgresql_main.id
}

output "postgresql_main_host" {
  description = "Database cluster's hostname."
  value       = digitalocean_database_cluster.postgresql_main.host
}

output "postgresql_main_private_host" {
  description = "Same as host, but only accessible from resources within the account and in the same region."
  value       = digitalocean_database_cluster.postgresql_main.private_host
}

output "postgresql_main_port" {
  description = "Network port that the database cluster is listening on."
  value       = digitalocean_database_cluster.postgresql_main.port
}

output "postgresql_main_uri" {
  description = "The full URI for connecting to the database cluster."
  value       = digitalocean_database_cluster.postgresql_main.uri
  sensitive   = true
}

output "postgresql_main_private_uri" {
  description = "Same as uri, but only accessible from resources within the account and in the same region."
  value       = digitalocean_database_cluster.postgresql_main.private_uri
  sensitive   = true
}

output "postgresql_main_default_database" {
  description = "Name of the cluster's default database."
  value       = digitalocean_database_cluster.postgresql_main.database
}

output "postgresql_main_default_user" {
  description = "Username for the cluster's default user."
  value       = digitalocean_database_cluster.postgresql_main.user
}

output "postgresql_main_default_user_password" {
  description = "Password for the cluster's default user."
  value       = digitalocean_database_cluster.postgresql_main.password
  sensitive   = true
}

output "database_firewall_id" {
  value       = digitalocean_database_firewall.firewall.id
  description = "A unique identifier for the firewall"
}

output "database_users_id" {
  description = "A unique identifier for database users"
  value       = [for id in var.database_users : digitalocean_database_user.user_creation[id].id]

}

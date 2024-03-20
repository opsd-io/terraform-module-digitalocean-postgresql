variable "databasename" {
  description = "The name of the database cluster."
  type        = string
  nullable    = false
}
variable "postgresql_main_node_count" {
  description = "Number of mysql nodes that will be created."
  type        = number
  default     = 1
}

variable "engine" {
  description = "Database engine used by the cluster."
  type        = string
  default     = "mysql"
}

variable "postgresql_main_size" {
  description = "The mysql node instance size."
  type        = string
  default     = "db-s-1vcpu-1gb"
}

variable "version_of_engine" {
  description = "Engine version used by the cluster."
  type        = number
  default     = 8
}

variable "region" {
  description = "DigitalOcean region where the cluster will reside."
  type        = string
  nullable    = false
}

variable "common_tags" {
  description = "A list of tag names to be applied to the database cluster"
  type        = set(string)
}

variable "firewall_rules" {
  type        = set(string)
  default     = []
  description = "List of trusted sources associated with the cluster"
}

variable "database_users" {
  type        = set(string)
  default     = []
  description = "List of users"
}

variable resource_group_name {
  type        = string
  default     = ""
  description = "description"
}

variable location {
  type        = string
  default     = ""
  description = "description"
}


resource "azurerm_redis_cache" "example" {
  name                = "example-redis-cache"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  redis_configuration {
    maxmemory_reserved = 2
    maxmemory_delta    = 2
    maxmemory_policy   = "allkeys-lru"
  }
}

output "hostname" {
  value = azurerm_redis_cache.example.hostname
}

output "primary_access_key" {
  value = azurerm_redis_cache.example.primary_access_key
  sensitive = true
}

output "port" {
  value = 6380  # Default SSL port for Azure Redis Cache
}



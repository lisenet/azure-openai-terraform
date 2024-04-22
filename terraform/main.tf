resource "azurerm_resource_group" "main" {
  location = var.resource_group_location
  name     = var.env_name
}

resource "azurerm_cognitive_account" "main" {
  kind                          = "OpenAI"
  location                      = azurerm_resource_group.main.location
  name                          = var.env_name
  public_network_access_enabled = true
  resource_group_name           = azurerm_resource_group.main.name
  sku_name                      = "S0"
  custom_subdomain_name         = var.env_name

  network_acls {
    default_action = "Allow"
  }
}

resource "azurerm_cognitive_deployment" "main" {
  cognitive_account_id   = azurerm_cognitive_account.main.id
  name                   = var.env_name
  version_upgrade_option = "OnceNewDefaultVersionAvailable"

  model {
    format  = "OpenAI"
    name    = var.openai_model_name
    version = var.openai_model_version
  }

  scale {
    type     = "Standard"
    capacity = var.openai_tokens_per_minute
  }
}

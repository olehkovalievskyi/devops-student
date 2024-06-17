provider "azurerm" {
  use_oidc = true
  features {}
}

data "azurerm_client_config"  "current" {}
data "azurerm_subscription"   "current" {}

resource "azurerm_resource_group" "current" {
  name = var.resource_group_name
  location = var.resource_group_location
}

module "key" {
  source = "./modules/keys"
  vault_name = var.vault_name
  key_name = var.key_name
  client_config = data.azurerm_client_config.current
  resource_group = azurerm_resource_group.current
}

module "storage" {
  source = "./modules/storage"
  storage_prefix = var.storage_prefix
  resource_group = azurerm_resource_group.current
}
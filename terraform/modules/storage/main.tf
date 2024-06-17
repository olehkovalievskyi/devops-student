resource "azurerm_storage_account" "storage" {
  name                     = "${var.storage_prefix}${lower(random_id.storage_account.hex)}"
  resource_group_name      = var.resource_group.name
  location                 = var.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}


resource "random_id" "storage_account" {
  byte_length = 4
}
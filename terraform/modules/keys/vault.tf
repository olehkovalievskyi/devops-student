resource "azurerm_key_vault" "vault" {
  name                        = var.vault_name
  location                    = var.resource_group.location
  resource_group_name         = var.resource_group.name
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 90
  tenant_id                   = var.client_config.tenant_id
  sku_name = "standard"

    access_policy {
      tenant_id = var.client_config.tenant_id
      object_id = var.client_config.object_id

      key_permissions = [
        "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey"
      ]

      secret_permissions = [
       "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
      ]

      certificate_permissions = [
        "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"
     ]

      storage_permissions = [
        "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"
      ]
    }
}
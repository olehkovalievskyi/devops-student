# # Generate SSH key pair
# resource "tls_private_key" "vm_ssh_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# data "azurerm_resource_group" "current" {
#   name = var.resource_group
# }

# resource "azurerm_key_vault" "vault" {
#   name                        = "ssh-key-${var.project_tag}"
#   location                    = data.azurerm_resource_group.current.location
#   resource_group_name         = data.azurerm_resource_group.current.name
#   enabled_for_disk_encryption = true
#   soft_delete_retention_days  = 90
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   sku_name = "standard"

#     access_policy {
#       tenant_id = data.azurerm_client_config.current.tenant_id
#       object_id = data.azurerm_client_config.current.object_id

#       key_permissions = [
#         "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey"
#       ]

#       secret_permissions = [
#        "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
#       ]

#       certificate_permissions = [
#         "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"
#      ]

#       storage_permissions = [
#         "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"
#       ]
#     }
# }


# resource "azurerm_key_vault_secret" "ssh_private_key" {
#   name         = "ssh-private-key"
#   value        = tls_private_key.vm_ssh_key.private_key_pem
#   key_vault_id = azurerm_key_vault.vault.id
#   content_type = "text/plain"
# }

# resource "azurerm_key_vault_secret" "ssh_public_key" {
#   name         = "ssh-public-key"
#   value        = tls_private_key.vm_ssh_key.public_key_openssh
#   key_vault_id = azurerm_key_vault.vault.id
#   content_type = "text/plain"
# }
output storage_name {
    value = module.storage.storage_name
}

output resource_group {
    value = "name: ${azurerm_resource_group.current.name}, location: ${azurerm_resource_group.current.location}"
}
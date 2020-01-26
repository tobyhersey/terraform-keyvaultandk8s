# variable "location" {
#   type    = "string"
#   default = "UK South"
# }

resource "azurerm_resource_group" "example" {
  name     = "resourceGroup1"
  location = "${var.location}"
}

resource "azurerm_key_vault" "example" {
  name                        = "testvault-1234"
  location                    = "${azurerm_resource_group.example.location}"
  resource_group_name         = "${azurerm_resource_group.example.name}"
  enabled_for_disk_encryption = true
  tenant_id                   = "d6e396d0-5584-41dc-9fc0-268df99bc610"

  sku_name = "standard"

  access_policy {
    tenant_id = "d6e396d0-5584-41dc-9fc0-268df99bc610"
    object_id = "d746815a-0433-4a21-b95d-fc437d2d475b"

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  tags = {
    environment = "Development"
  }
}

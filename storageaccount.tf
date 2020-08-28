provider "azurerm" {
    version = 1.38
}

resource "azurerm_storage_account" "sa_lab"{
    name = "saankit123"
    resource_group_name = "156-3b456db2-deploy-an-azure-storage-account-with"
    location = "East US"
    account_tier = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "Terraform Storage"
        CreatedBy = "Ankit"
    }
}
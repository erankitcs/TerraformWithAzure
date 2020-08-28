provider "azurerm" {
    version = 1.38
}

resource "azurerm_storage_account" "sa_lab"{
    name = "saankit124"
    resource_group_name = "183-20b133c6-deploy-an-azure-file-share-with-terra"
    location = "East US"
    account_tier = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "Terraform Storage"
        CreatedBy = "Ankit"
    }
}

resource "azurerm_storage_container" "sc_lab" {
    name = "blobcontainerankit124"
    storage_account_name = azurerm_storage_account.sa_lab.name
    container_access_type = "private"
}

resource "azurerm_storage_blob" "sb-lab" {
    name = "BlobAnkit124"
    storage_account_name = azurerm_storage_account.sa_lab.name
    storage_container_name = azurerm_storage_container.sc_lab.name
    type = "Block"
}

resource "azurerm_storage_share" "ss-lab" {
    name = "fileshareankit124"
    storage_account_name = azurerm_storage_account.sa_lab.name
    quota = 50
}
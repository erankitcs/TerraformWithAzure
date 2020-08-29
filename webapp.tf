provider "azurerm" {
    version = 1.38
    }

resource "azurerm_app_service_plan" "svcplan" {
    name = "tfappsvcplan1"
    location = "eastus"
    resource_group_name = "191-cf09d270-deploy-a-web-application-with-terrafo"
    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "appsvc" {
    name = "tfwebappsvc1"
    location = "eastus"
    resource_group_name = "191-cf09d270-deploy-a-web-application-with-terrafo"
    app_service_plan_id = azurerm_app_service_plan.svcplan.id
    site_config {
        dotnet_framework_version = "v4.0"
        scm_type = "LocalGit"
    }
}
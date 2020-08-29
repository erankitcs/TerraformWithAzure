provider "azurerm" {
    version = 1.38
    }

resource "azurerm_mysql_server" "mysqlserver" {
    name = "mysql-terraformserver-1"
    location = "East US"
    resource_group_name = "186-86ee009d-deploy-a-mariadb-database-with-terraf"
    sku {
        name = "B_Gen5_2"
        capacity = 2
        tier = "Basic"
        family = "Gen5"
    }
    storage_profile {
        storage_mb = 5120
        backup_retention_days = 7
        geo_redundant_backup = "Disabled"
    }
    administrator_login = "mysqladmin"
    administrator_login_password = "easytologin4once!"
    version = "5.7"
    ssl_enforcement = "Enabled"
}

resource "azurerm_mysql_database" "mysqldb" {
  name                = "tfdb"
  resource_group_name = "186-86ee009d-deploy-a-mariadb-database-with-terraf"
  server_name         = azurerm_mysql_server.mysqlserver.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}


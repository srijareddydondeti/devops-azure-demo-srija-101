provider "azurerm" {
  features = {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location
}

resource "azurerm_container_group" "app" {
  name                = var.container_group_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"

  container {
    name   = "app"
    image  = var.image
    cpu    = "0.5"
    memory = "1.0"

    ports {
      port     = 8080
      protocol = "TCP"
    }
    environment_variables = {
      APP_VERSION = "1.0"
    }
  }

  ip_address_type = "public"
  dns_name_label  = "${var.container_group_name}-${random_pet.name.id}"

  tags = {
    environment = "demo"
  }
}

resource "random_pet" "name" {
  length = 2
}

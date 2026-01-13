resource "azurerm_service_plan" "plan" {
  name                = "plan-webapp-test"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "webapp-test-${random_string.suffix.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    always_on = false
  }
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}
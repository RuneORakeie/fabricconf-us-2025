#######################
###  Executing USER ###
#######################
# data "azuread_client_config" "current" {
# }
#######################
### RESOURCE GROUPS ###
#######################
data "azurerm_resource_group" "fc_cap_rg" {
  name = "datarunefabric-wus"
}
#######################
### FABRIC CAPACITY ###
#######################
data "fabric_capacity" "capacity" {
  display_name = azurerm_fabric_capacity.kql_demo.name
}
#######################
###  Entra ID User  ###
#######################
data "azuread_user" "admin" {
  user_principal_name = var.admin_user
}
# data "azuread_user" "admin2" {
#   user_principal_name = var.admin_user2
# }
#######################
### Entra ID Group  ###
#######################
data "azuread_group" "fabric_ws_contributors" {
  display_name = "Terraform Demo - Workspace Contributors"
}
###################################
### Entra ID Service Principal  ###
###################################
data "azuread_service_principal" "tf_sp" {
  display_name = "pcs-s-sp-terraform"
}

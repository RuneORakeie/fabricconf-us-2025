#############################################
#          Azure Resource Manager           #
#############################################
provider "azurerm" {
  features {}
  client_id                       = var.client_id
  use_oidc                        = true
  resource_provider_registrations = "none"
}
#############################################
#          Azure Active Directory           #
#############################################
provider "azuread" {
  client_id = var.client_id
  use_oidc  = true
}
#############################################
#           Microsoft Fabric                #
#############################################
provider "fabric" {
  preview = true
  # use_oidc = true
}

#############################################
#       Microsoft Fabric REST API           #
#############################################

provider "restapi" {
  uri                  = "https://api.fabric.microsoft.com/v1"
  write_returns_object = true

  headers = {
    Authorization = "Bearer ${jsondecode(data.http.azure_token.response_body).access_token}"
  }
}
data "http" "azure_token" {
  # The token endpoint URL with variable interpolation
  url = "https://login.microsoftonline.com/${var.tenant_id}/oauth2/v2.0/token"
  # Specify POST method for token request
  method = "POST"
  # Set required headers for token request
  request_headers = {
    "Content-Type" = "application/x-www-form-urlencoded"
  }
  # Form-encoded body with OAuth2 parameters
  request_body = "grant_type=client_credentials&client_id=${var.client_id}&client_secret=${var.client_secret}&scope=https://api.fabric.microsoft.com/.default"
}

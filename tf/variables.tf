variable "solution_name" {
  description = "Name of the solution"
  type        = string
  default     = "fabricconf2025us"
}
variable "location" {
  description = "Location of the Azure resources"
  type        = string
  default     = "WestUS3"
}

variable "fabric_capacity_sku" {
  description = "Fabric Capacity SKU name"
  type        = string
  default     = "F2"
}

# Authentication variables fro the RESTAPI provider
variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
  sensitive   = true
  # Will read from TF_VAR_tenant_id environment variable
}
variable "client_id" {
  description = "Azure client ID"
  type        = string
  sensitive   = true
  # Will read from TF_VAR_client_id environment variable
}
variable "client_secret" {
  description = "Azure client secret"
  type        = string
  sensitive   = true
  # Will read from TF_VAR_client_secret environment variable
}
# variable "local_dev_client_id" {
#   description = "Azure client ID"
#   type        = string
# }
variable "admin_user" {
  description = "MS Fabric admin user"
  type        = string
  sensitive   = true
  # Will read from TF_VAR_admin_user environment variable
}
# variable "admin_user2" {
#   description = "MS Fabric admin user"
#   type        = string
#   sensitive   = true
#   # Will read from TF_VAR_admin_user2 environment variable
# }
variable "azeventhub_saskey" {
  description = "Shared Access Key for the Event Hub"
  type        = string
  sensitive   = true
  # Will read from TF_VAR_azeventhub_saskey environment variable

}

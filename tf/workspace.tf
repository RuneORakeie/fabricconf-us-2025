# resource "azuread_group" "fabric_ws_contributors" {
#   display_name     = "Terraform Demo - Workspace Contributors"
#   owners           = [data.azuread_client_config.current.object_id, data.azuread_user.admin.object_id]
#   security_enabled = true
#   members = [
#     data.azuread_user.admin.object_id,
#     data.azuread_user.admin2.object_id,
#     /* more users */
#   ]
# }

module "demo_ws_prod" {
  source        = "github.com/RuneORakeie/terraform-modules-fabric//fabric-workspace?ref=beta-v0.1.2"
  display_name  = "FabricConf US 2025 - RTI demo"
  description   = "FabconUS2025 - RTI demo workspace"
  capacity_id   = data.fabric_capacity.capacity.id
  identity_type = "SystemAssigned"
  role_assignment_list = [
    {
      principal_id   = data.azuread_group.fabric_ws_contributors.object_id
      principal_type = "Group"
      role           = "Contributor"
    },
    {
      principal_id   = data.azuread_user.admin.object_id
      principal_type = "User"
      role           = "Admin"
    },
  ]
}

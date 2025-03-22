module "demo_ws_prod_restore" {
  source        = "github.com/RuneORakeie/terraform-modules-fabric//fabric-workspace?ref=beta-v0.1.2"
  display_name  = "${var.solution_name_restored} - WS"
  description   = "SQLK2025 - RTI demo workspace"
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


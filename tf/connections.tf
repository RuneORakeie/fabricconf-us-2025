module "ws_conn_eventhub" {
  source          = "github.com/RuneORakeie/terraform-modules-fabric//fabric-connection?ref=beta-v0.1.2"
  connection_name = "FabCon-Events datarune"
  connection_type = "EventHub"

  connectivity_type = "ShareableCloud"
  privacy_level     = "None" # Optional, defaults to "Organizational"

  eventhub_parameters = {
    namespace = "rasberrypi-sim-wus"
    name      = "pcs-d-ehub-rasberrypi-sim-wus"
  }

  eventhub_credentials = {
    shared_access_key_name = "Fabric"
    shared_access_key      = var.azeventhub_saskey
  }

  # Optional: Add role assignments
  connection_role_assignments = [
    {
      principal_id   = data.azuread_user.admin.object_id
      principal_type = "User"
      role           = "Owner"
    },

  ]
}

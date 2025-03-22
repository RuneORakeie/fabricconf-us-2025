########################
###  KQL EVENTHOUSE  ###
########################
resource "fabric_eventhouse" "kql_demo" {
  display_name = "eh-${var.solution_name}"
  workspace_id = module.demo_ws_prod.id
  lifecycle {
    ignore_changes = [
    ]
  }
}
########################
###   KQL DATABASE   ###
########################
resource "fabric_kql_database" "kql_demo_db_1" {
  display_name = "kql-db-${var.solution_name}-01"
  workspace_id = module.demo_ws_prod.id

  configuration = {
    database_type = "ReadWrite"
    eventhouse_id = fabric_eventhouse.kql_demo.id
  }
  lifecycle {
    ignore_changes = [
      configuration,
    ]
  }
  depends_on = [fabric_eventhouse.kql_demo]
}
# resource "fabric_kql_database" "kql_demo_db_2" {
#   display_name = "kql-db-${var.solution_name}-02"
#   workspace_id = module.demo_ws_prod.id

#   configuration = {
#     database_type = "ReadWrite"
#     eventhouse_id = fabric_eventhouse.kql_demo.id
#   }
#   lifecycle {
#     ignore_changes = [
#       configuration,
#     ]
#   }
#   depends_on = [fabric_kql_database.kql_demo_db_1]
# }
########################
### KQL EVENTSTREAM  ###
########################
resource "fabric_eventstream" "kql_demo_es" {
  display_name = "kql-es-${var.solution_name}"
  workspace_id = module.demo_ws_prod.id
}
########################
###   KQL DASHBOARD  ###
########################
resource "fabric_kql_dashboard" "kql_demo_dash" {
  display_name = "kql-dash-${var.solution_name}"
  description  = "kql-dash-${var.solution_name}"
  workspace_id = module.demo_ws_prod.id
}

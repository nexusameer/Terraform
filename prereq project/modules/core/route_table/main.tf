################################################
##                                            ##
##        internet Route Table                ##
##                                            ##
################################################

resource "azurerm_route_table" "route_table_core" {
  name                = "${var.core_route_table_name}_${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  route {
    name                   = var.core_route
    address_prefix         = var.core_route_address_prefix
    next_hop_type          = var.core_next_hop_type
    next_hop_in_ip_address = var.core_next_hop_ip_address
  }
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.core

}

resource "azurerm_subnet_route_table_association" "route_table_subnet_ba_core" {
  subnet_id      = var.batchaccount_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}
resource "azurerm_subnet_route_table_association" "core_route_table_subnet_db_core" {
  subnet_id      = var.db_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}
# resource "azurerm_subnet_route_table_association" "core_route_table_subnet_fap_core" {
#   subnet_id      = var.functionapp_subnet_id 
#   route_table_id = azurerm_route_table.route_table_core.id
#   provider                          = azurerm.core
# }
resource "azurerm_subnet_route_table_association" "route_table_subnet_pe_core" {
  subnet_id      = var.private_endpoint_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_fap_core" {
  subnet_id      = var.functionapp_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}

# resource "azurerm_subnet_route_table_association" "route_table_subnet_bricks_container_core" {
#   subnet_id      = var.bricks_container_subnet_id
#   route_table_id = azurerm_route_table.route_table_core.id
#   provider       = azurerm.core
# }

# resource "azurerm_subnet_route_table_association" "route_table_subnet_bricks_host_core" {
#   subnet_id      = var.bricks_host_subnet_id
#   route_table_id = azurerm_route_table.route_table_core.id
#   provider       = azurerm.core
# }

# resource "azurerm_subnet_route_table_association" "route_table_subnet_pe_d_bricks_cp_core" {
#   subnet_id      = var.pe_d_bricks_cp_subnet_id
#   route_table_id = azurerm_route_table.route_table_core.id
#   provider       = azurerm.core
# }

# resource "azurerm_subnet_route_table_association" "route_table_subnet_bricks_managed_core" {
#   subnet_id      = var.bricks_managed_subnet_id
#   route_table_id = azurerm_route_table.route_table_core.id
#   provider       = azurerm.core
# }

resource "azurerm_subnet_route_table_association" "route_table_subnet_ml_batch_account_core" {
  subnet_id      = var.ml_batch_account_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_ml_function_app_core" {
  subnet_id      = var.ml_function_app_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_ml_pe_core" {
  subnet_id      = var.ml_pe_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_lss_batch_account_core" {
  subnet_id      = var.lss_batch_account_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_lss_function_app_core" {
  subnet_id      = var.lss_function_app_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_lss_pe_core" {
  subnet_id      = var.lss_pe_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_inv_db_core" {
  subnet_id      = var.inv_db_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_inv_function_app_core" {
  subnet_id      = var.inv_function_app_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_inv_pe_core" {
  subnet_id      = var.inv_pe_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_inv_vm_core" {
  subnet_id      = var.inv_vm_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_event_hub_pe_core" {
  subnet_id      = var.event_hub_pe_subnet_id
  route_table_id = azurerm_route_table.route_table_core.id
  provider       = azurerm.core
}
###########################################################################
#                                                                        ##
#    Peering from AZ_VNET_WE_SENSOR_DASHBOARD to AZ_VNET_WE_CORE         ##
#                                                                        ##
###########################################################################

#VNet Peering from subs2 (az_vnet_we_sensor_dashboard) to subs1 (az_vnet_we_core)
# resource "azurerm_virtual_network_peering" "peering_we_sensor_to_core" {
#   name                         = "${var.vnet_peering_sensor_name}_${var.environment}_to_${var.vnet_peering_core_name}_${var.environment}"
#   resource_group_name          = var.sensor_resource_group_name
#   virtual_network_name         = var.sensor_vnet_virtual_network_name
#   remote_virtual_network_id    = var.remote_vnet_core_id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = false
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   provider                     = azurerm.app
# }
###########################################################################
#                                                                        ##
#    Peering from AZ_VNET_WE_CORE to AZ_VNET_WE_SENSOR_DASHBOARD         ##
#                                                                        ##
###########################################################################
#VNet Peering from subs1 (az_vnet_we_core) to subs2 (az_vnet_we_sensor_dashboard)
# resource "azurerm_virtual_network_peering" "peering_we_core_to_sensor" {
#   name                         = "${var.vnet_peering_core_name}_${var.environment}_to_${var.vnet_peering_sensor_name}_${var.environment}"
#   resource_group_name          = var.core_resource_group_name
#   virtual_network_name         = var.core_virtual_network_name
#   remote_virtual_network_id    = var.sensor_dashboard_vnet_id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = false
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   provider                     = azurerm.core

# }

###########################################################################
#                                                                        ##
#    Peering from AZ_VNET_WE_GITLAB to AZ_VNET_WE_CORE                   ##
#                                                                        ##
###########################################################################

# #VNet Peering from subs2 (az_vnet_we_gitlab) to subs1 (az_vnet_we_core)
# resource "azurerm_virtual_network_peering" "peering_we_gitlab_to_core" {
#   name                         = "${var.vnet_peering_gitlab_name}_to_${var.vnet_peering_core_name}_${var.environment}"
#   resource_group_name          = var.gitlab_resource_group_name
#   virtual_network_name         = var.gitlab_vnet_name
#   remote_virtual_network_id    = var.remote_vnet_core_id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = false
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   provider                     = azurerm.management
# }
###########################################################################
#                                                                        ##
#    Peering from AZ_VNET_WE_CORE to AZ_VNET_WE_GITLAB                   ##
#                                                                        ##
###########################################################################
#VNet Peering from subs1 (az_vnet_we_core) to subs2 (az_vnet_we_gitlab)
# resource "azurerm_virtual_network_peering" "peering_we_core_to_gitlab" {
#   name                         = "${var.vnet_peering_core_name}_${var.environment}_to_${var.vnet_peering_gitlab_name}"
#   resource_group_name          = var.core_resource_group_name
#   virtual_network_name         = var.core_virtual_network_name
#   remote_virtual_network_id    = var.gitlab_vnet_id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = false
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   provider                     = azurerm.core

# }


###########################################################################
#                                                                        ##
#    Peering from AZ_VNET_WE_GITLAB to AZ_VNET_WE_SENSOR_DASHBOARD       ##
#                                                                        ##
###########################################################################

#VNet Peering from subs2 (az_vnet_we_gitlab) to subs1 (az_vnet_we_sensor_dashboard)
# resource "azurerm_virtual_network_peering" "peering_we_gitlab_to_sensor" {
#   name                         = "${var.vnet_peering_gitlab_name}_to_${var.vnet_peering_sensor_name}_${var.environment}"
#   resource_group_name          = var.gitlab_resource_group_name
#   virtual_network_name         = var.gitlab_vnet_name
#   remote_virtual_network_id    = var.sensor_dashboard_vnet_id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = false
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   provider                     = azurerm.management
# }
###########################################################################
#                                                                        ##
#    Peering from AZ_VNET_WE_SENSOR_DASHBOARD to AZ_VNET_WE_GITLAB       ##
#                                                                        ##
###########################################################################
#VNet Peering from subs1 (az_vnet_we_sensor_dashboard) to subs2 (az_vnet_we_gitlab)
# resource "azurerm_virtual_network_peering" "peering_we_sensor_to_gitlab" {
#   name                         = "${var.vnet_peering_sensor_name}_${var.environment}_to_${var.vnet_peering_gitlab_name}"
#   resource_group_name          = var.sensor_resource_group_name
#   virtual_network_name         = var.sensor_vnet_virtual_network_name
#   remote_virtual_network_id    = var.gitlab_vnet_id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = false
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   provider                     = azurerm.app

# }


###########################################################################
#                                                                        ##
#    Peering from AZ_VNET_WE_KVAP to AZ_VNET_WE_CORE                     ##
#                                                                        ##
###########################################################################

#VNet Peering from subs2 (az_vnet_we_kvap) to subs1 (az_vnet_we_core)
# resource "azurerm_virtual_network_peering" "peering_we_kvap_to_core" {
#   name                         = "${var.vnet_peering_kvap_name}_to_${var.vnet_peering_core_name}_${var.environment}"
#   resource_group_name          = var.kvap_rg_name
#   virtual_network_name         = var.kvap_vnet_name
#   remote_virtual_network_id    = var.remote_vnet_core_id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = false
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   provider                     = azurerm.app
# }
###########################################################################
#                                                                        ##
#    Peering from AZ_VNET_WE_CORE to AZ_VNET_WE_KVAP                     ##
#                                                                        ##
###########################################################################
#VNet Peering from subs1 (az_vnet_we_core) to subs2 (az_vnet_we_kvap)
# resource "azurerm_virtual_network_peering" "peering_we_core_to_kvap" {
#   name                         = "${var.vnet_peering_core_name}_${var.environment}_to_${var.vnet_peering_kvap_name}"
#   resource_group_name          = var.core_resource_group_name
#   virtual_network_name         = var.core_virtual_network_name
#   remote_virtual_network_id    = var.kvap_vnet_id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = false
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   provider                     = azurerm.core

# }

###########################################################################
#                                                                        ##
#    Peering from AZ_VNET_WE_GITLAB to AZ_VNET_WE_CH                     ##
#                                                                        ##
###########################################################################

#VNet Peering from subs2 (az_vnet_we_gitlab) to subs1 (az_vnet_we_sensor_dashboard)
# resource "azurerm_virtual_network_peering" "peering_we_gitlab_to_ch" {
#   name                         = "${var.vnet_peering_gitlab_name}_to_${var.vnet_peering_ch_name}_${var.environment}"
#   resource_group_name          = var.gitlab_resource_group_name
#   virtual_network_name         = var.gitlab_vnet_name
#   remote_virtual_network_id    = var.ch_vnet_id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = false
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   provider                     = azurerm.management
# }

###########################################################################
#                                                                        ##
#    Peering from AZ_VNET_WE_CH to AZ_VNET_WE_GITLAB                     ##
#                                                                        ##
###########################################################################
#VNet Peering from subs1 (az_vnet_we_core) to subs2 (az_vnet_we_gitlab)
# resource "azurerm_virtual_network_peering" "peering_we_ch_to_gitlab" {
#   name                         = "${var.vnet_peering_ch_name}_${var.environment}_to_${var.vnet_peering_gitlab_name}"
#   resource_group_name          = var.resource_group_ch_name
#   virtual_network_name         = var.vnet_ch_name
#   remote_virtual_network_id    = var.gitlab_vnet_id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = false
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   provider                     = azurerm.app

# }

###########################################################################
#                                                                        ##
#    Peering from AZ_VNET_WE_CH to AZ_VNET_WE_CORE                       ##
#                                                                        ##
###########################################################################

#VNet Peering from subs2 (az_vnet_we_sensor_dashboard) to subs1 (az_vnet_we_core)
# resource "azurerm_virtual_network_peering" "peering_we_ch_to_core" {
#   name                         = "${var.vnet_peering_ch_name}_${var.environment}_to_${var.vnet_peering_core_name}_${var.environment}"
#   resource_group_name          = var.resource_group_ch_name
#   virtual_network_name         = var.vnet_ch_name
#   remote_virtual_network_id    = var.remote_vnet_core_id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = false
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   provider                     = azurerm.app
# }
###########################################################################
#                                                                        ##
#    Peering from AZ_VNET_WE_CORE to AZ_VNET_WE_CH_DASHBOARD             ##
#                                                                        ##
###########################################################################
#VNet Peering from subs1 (az_vnet_we_core) to subs2 (az_vnet_we_sensor_dashboard)
# resource "azurerm_virtual_network_peering" "peering_we_core_to_ch" {
#   name                         = "${var.vnet_peering_core_name}_${var.environment}_to_${var.vnet_peering_ch_name}_${var.environment}"
#   resource_group_name          = var.core_resource_group_name
#   virtual_network_name         = var.core_virtual_network_name
#   remote_virtual_network_id    = var.ch_vnet_id
#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = false
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   provider                     = azurerm.core

# }

###########################################################################
#                                                                        ##
#               Peering from Connectivity to Core                        ##
#                                                                        ##
###########################################################################

resource "azurerm_virtual_network_peering" "peering_connectivity_to_core" {
  name                         = "${var.vnet_connectivity_peering_name}_to_${var.vnet_peering_core_name}_${var.environment}"
  resource_group_name          = var.connectivity_rg_name
  virtual_network_name         = var.connectivity_vnet_name
  remote_virtual_network_id    = var.remote_vnet_core_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
  provider                     = azurerm.connectivity
}
###########################################################################
#                                                                        ##
#                   Peering from Core to Connectivity                    ##
#                                                                        ##
###########################################################################
resource "azurerm_virtual_network_peering" "peering_core_to_connectivity" {
  name                         = "${var.vnet_peering_core_name}_${var.environment}_to_${var.vnet_connectivity_peering_name}"
  resource_group_name          = var.core_resource_group_name
  virtual_network_name         = var.core_virtual_network_name
  remote_virtual_network_id    = var.connectivity_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
  provider                     = azurerm.core

}

###########################################################################
#                                                                        ##
#               Peering from Connectivity to Sensor                      ##
#                                                                        ##
###########################################################################

resource "azurerm_virtual_network_peering" "peering_connectivity_to_sensor" {
  name                         = "${var.vnet_connectivity_peering_name}_to_${var.vnet_peering_sensor_name}_${var.environment}"
  resource_group_name          = var.connectivity_rg_name
  virtual_network_name         = var.connectivity_vnet_name
  remote_virtual_network_id    = var.sensor_dashboard_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
  provider                     = azurerm.connectivity
}
###########################################################################
#                                                                        ##
#                   Peering from Sensor to Connectivity                  ##
#                                                                        ##
###########################################################################
resource "azurerm_virtual_network_peering" "peering_sensor_to_connectivity" {
  name                         = "${var.vnet_peering_sensor_name}_${var.environment}_to_${var.vnet_connectivity_peering_name}"
  resource_group_name          = var.sensor_resource_group_name
  virtual_network_name         = var.sensor_vnet_virtual_network_name
  remote_virtual_network_id    = var.connectivity_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
  provider                     = azurerm.app

}

###########################################################################
#                                                                        ##
#               Peering from Connectivity to CH                          ##
#                                                                        ##
###########################################################################

resource "azurerm_virtual_network_peering" "peering_connectivity_to_ch" {
  name                         = "${var.vnet_connectivity_peering_name}_to_${var.vnet_peering_ch_name}_${var.environment}"
  resource_group_name          = var.connectivity_rg_name
  virtual_network_name         = var.connectivity_vnet_name
  remote_virtual_network_id    = var.ch_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
  provider                     = azurerm.connectivity
}
###########################################################################
#                                                                        ##
#                   Peering from CH to Connectivity                      ##
#                                                                        ##
###########################################################################
resource "azurerm_virtual_network_peering" "peering_ch_to_connectivity" {
  name                         = "${var.vnet_peering_ch_name}_${var.environment}_to_${var.vnet_connectivity_peering_name}"
  resource_group_name          = var.resource_group_ch_name
  virtual_network_name         = var.vnet_ch_name
  remote_virtual_network_id    = var.connectivity_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
  provider                     = azurerm.app

}

###########################################################################
#                                                                        ##
#               Peering from Connectivity to KVAP                        ##
#                                                                        ##
###########################################################################

resource "azurerm_virtual_network_peering" "peering_connectivity_to_kvap" {
  name                         = "${var.vnet_connectivity_peering_name}_to_${var.vnet_peering_kvap_name}_${var.environment}"
  resource_group_name          = var.connectivity_rg_name
  virtual_network_name         = var.connectivity_vnet_name
  remote_virtual_network_id    = var.kvap_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
  provider                     = azurerm.connectivity
}
###########################################################################
#                                                                        ##
#                   Peering from KVAP to Connectivity                    ##
#                                                                        ##
###########################################################################
resource "azurerm_virtual_network_peering" "peering_kvap_to_connectivity" {
  name                         = "${var.vnet_peering_kvap_name}_${var.environment}_to_${var.vnet_connectivity_peering_name}"
  resource_group_name          = var.kvap_rg_name
  virtual_network_name         = var.kvap_vnet_name
  remote_virtual_network_id    = var.connectivity_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
  provider                     = azurerm.app

}
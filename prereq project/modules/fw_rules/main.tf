resource "azurerm_firewall_policy_rule_collection_group" "firewall_policy_rule" {
  name               = var.fw_policy_rule_cg_name
  firewall_policy_id = var.fw_policy_id
  priority           = 100

  network_rule_collection {
    name     = var.network_collection_rule_name
    priority = 100
    action   = "Allow"
 rule {
      name                  = var.core_to_ch_rule_name
      protocols             = ["Any"]
      source_addresses      = var.core_vnet_address_space
      destination_addresses = var.ch_vnet_address_space
      destination_ports     = ["*"]
    }
rule {
      name                  = var.ch_to_core_rule_name
      protocols             = ["Any"]
      source_addresses      = var.ch_vnet_address_space
      destination_addresses = var.core_vnet_address_space
      destination_ports     = ["*"]
    }
rule {
      name                  = var.core_to_kvap_rule_name
      protocols             = ["Any"]
      source_addresses      = var.core_vnet_address_space
      destination_addresses = var.kvap_vnet_address_space
      destination_ports     = ["*"]
    }
rule {
      name                  = var.kvap_to_core_rule_name
      protocols             = ["Any"]
      source_addresses      = var.kvap_vnet_address_space
      destination_addresses = var.core_vnet_address_space
      destination_ports     = ["*"]
    }
rule {
      name                  = var.core_to_sensor_rule_name
      protocols             = ["Any"]
      source_addresses      = var.core_vnet_address_space
      destination_addresses = var.sensor_vnet_address_space
      destination_ports     = ["*"]
    }
rule {
      name                  = var.sensor_to_core_rule_name
      protocols             = ["Any"]
      source_addresses      = var.sensor_vnet_address_space
      destination_addresses = var.core_vnet_address_space
      destination_ports     = ["*"]
    }  
  rule {
      name                  = var.core_to_vpop_rule_name
      protocols             = ["Any"]
      source_addresses      = var.core_vnet_address_space
      destination_addresses = var.vpop_address_space
      destination_ports     = ["*"]
    } 
rule {
      name                  = var.vpop_to_core_rule_name
      protocols             = ["Any"]
      source_addresses      = var.vpop_address_space
      destination_addresses = var.core_vnet_address_space
      destination_ports     = ["*"]
    }  
rule {
      name                  = var.ch_to_vpop_rule_name
      protocols             = ["Any"]
      source_addresses      = var.ch_vnet_address_space
      destination_addresses = var.vpop_address_space
      destination_ports     = ["*"]
    } 
rule {
      name                  = var.vpop_to_ch_rule_name
      protocols             = ["Any"]
      source_addresses      = var.vpop_address_space
      destination_addresses = var.ch_vnet_address_space
      destination_ports     = ["*"]
    } 
rule {
      name                  = var.vpop_to_kvap_rule_name
      protocols             = ["Any"]
      source_addresses      = var.vpop_address_space
      destination_addresses = var.kvap_vnet_address_space
      destination_ports     = ["*"]
    } 
rule {
      name                  = var.kvap_to_vpop_rule_name
      protocols             = ["Any"]
      source_addresses      = var.kvap_vnet_address_space
      destination_addresses = var.vpop_address_space
      destination_ports     = ["*"]
    }  
rule {
      name                  = var.sensor_to_vpop_rule_name
      protocols             = ["Any"]
      source_addresses      =  var.sensor_vnet_address_space
      destination_addresses = var.vpop_address_space
      destination_ports     = ["*"]
    } 
rule {
      name                  = var.vpop_to_sensor_rule_name
      protocols             = ["Any"]
      source_addresses      = var.vpop_address_space
      destination_addresses = var.sensor_vnet_address_space
      destination_ports     = ["*"]
    }                    
  rule {
      name                  = var.gitlab_to_vpop_rule_name
      protocols             = ["Any"]
      source_addresses      =  var.gitlab_vnet_address_space
      destination_addresses = var.vpop_address_space
      destination_ports     = ["*"]
    } 
rule {
      name                  = var.vpop_to_gitlab_rule_name
      protocols             = ["Any"]
      source_addresses      = var.vpop_address_space
      destination_addresses = var.gitlab_vnet_address_space
      destination_ports     = ["*"]
    }  
rule {
      name                  = var.sensor_to_internet_rule_name
      protocols             = ["Any"]
      source_addresses      = var.sensor_vnet_address_space
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
rule {
      name                  = var.batch_account_sensor_to_internet_rule_name
      protocols             = ["Any"]
      source_addresses      = var.sensor_batch_account_subnet_address_prefixes
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
rule {
      name                  = var.function_app_sensor_to_internet_rule_name
      protocols             = ["Any"]
      source_addresses      = var.sensor_functionapp_subnet_prefixes
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
rule {
      name                  = var.function_app_ml_to_internet_rule_name
      protocols             = ["Any"]
      source_addresses      = var.ml_function_app_subnet_address_prefixes
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
rule {
      name                  = var.batch_account_ml_to_internet_rule_name
      protocols             = ["Any"]
      source_addresses      = var.ml_batch_account_subnet_address_prefixes
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
rule {
      name                  = var.batch_account_lss_to_internet_rule_name
      protocols             = ["Any"]
      source_addresses      = var.lss_batch_account_subnet_address_prefixes
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }    
      
rule {
      name                  = var.function_app_lss_to_internet_rule_name
      protocols             = ["Any"]
      source_addresses      = var.lss_function_app_subnet_address_prefixes
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }    
  
rule {
      name                  = var.function_app_inv_to_internet_rule_name
      protocols             = ["Any"]
      source_addresses      = var.inv_function_app_subnet_address_prefixes
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
 }

   network_rule_collection {
    name     = var.management_collection_rule_name
    priority = 101
    action   = "Allow"

rule {
      name                  = var.gitlab_to_core_rule_name
      protocols             = ["Any"]
      source_addresses      = var.gitlab_vnet_address_space
      destination_addresses = var.core_vnet_address_space
      destination_ports     = ["*"]
    } 
rule {
      name                  = var.core_to_gitlab_rule_name
      protocols             = ["Any"]
      source_addresses      = var.core_vnet_address_space
      destination_addresses = var.gitlab_vnet_address_space
      destination_ports     = ["*"]
    }  
rule {
      name                  = var.gitlab_to_sensor_rule_name
      protocols             = ["Any"]
      source_addresses      = var.gitlab_vnet_address_space
      destination_addresses = var.sensor_vnet_address_space
      destination_ports     = ["*"]
    } 
rule {
      name                  = var.sensor_to_gitlab_rule_name
      protocols             = ["Any"]
      source_addresses      = var.sensor_vnet_address_space
      destination_addresses = var.gitlab_vnet_address_space
      destination_ports     = ["*"]
    } 
rule {
      name                  = var.gitlab_to_ch_rule_name
      protocols             = ["Any"]
      source_addresses      = var.gitlab_vnet_address_space
      destination_addresses = var.ch_vnet_address_space
      destination_ports     = ["*"]
    } 
rule {
      name                  = var.ch_to_gitlab_rule_name
      protocols             = ["Any"]
      source_addresses      = var.ch_vnet_address_space
      destination_addresses = var.gitlab_vnet_address_space
      destination_ports     = ["*"]
    }  
rule {
      name                  = var.gitlab_to_kvap_rule_name
      protocols             = ["Any"]
      source_addresses      = var.gitlab_vnet_address_space
      destination_addresses = var.kvap_vnet_address_space
      destination_ports     = ["*"]
    } 
rule {
      name                  = var.kvap_to_gitlab_rule_name
      protocols             = ["Any"]
      source_addresses      = var.kvap_vnet_address_space
      destination_addresses = var.gitlab_vnet_address_space
      destination_ports     = ["*"]
    }    
  rule {
      name                  = var.gitlab_to_internet_rule_name
      protocols             = ["Any"]
      source_addresses      = var.gitlab_vnet_address_space
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }      
          
 }

provider  = azurerm.connectivity

}
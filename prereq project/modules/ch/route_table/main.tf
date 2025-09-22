################################################
##                                            ##
##        internet Route Table                ##
##                                            ##
################################################

resource "azurerm_route_table" "route_table_ch" {
  name                = "${var.ch_route_table_name}_${var.environment}"
  location            = var.ch_resource_group_location
  resource_group_name = var.ch_resource_group_name

  route {
    name           = var.ch_route
    address_prefix = var.ch_route_address_prefix
    next_hop_type  = var.ch_next_hop_type
    next_hop_in_ip_address = var.ch_next_hop_ip_address
  }

  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )

  provider = azurerm.app

}

resource "azurerm_subnet_route_table_association" "route_table_subnet_ch_aks" {
  subnet_id      = var.ch_aks_subnet_id
  route_table_id = azurerm_route_table.route_table_ch_internet.id
  provider       = azurerm.app
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_ch_db" {
  subnet_id      = var.ch_db_subnet_id
  route_table_id = azurerm_route_table.route_table_ch.id
  provider       = azurerm.app
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_ch_pe" {
  subnet_id      = var.ch_pe_subnet_id
  route_table_id = azurerm_route_table.route_table_ch.id
  provider       = azurerm.app
}

resource "azurerm_route_table" "route_table_ch_internet" {
  name                = "${var.ch_internet_route_table_name}_${var.environment}"
  location            = var.ch_resource_group_location
  resource_group_name = var.ch_resource_group_name

  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )

  provider = azurerm.app
}

resource "azurerm_route" "routes_ch_internet" {
  for_each            = var.ch_routes
  name                = each.key
  resource_group_name = var.ch_resource_group_name
  route_table_name    = azurerm_route_table.route_table_ch_internet.name
  address_prefix      = each.value.address_prefix
  next_hop_type       = each.value.next_hop_type

  # Optional if next hop IP is required
  next_hop_in_ip_address = lookup(each.value, "next_hop_in_ip_address", null)

  provider = azurerm.app
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_ch_appgtw" {
  subnet_id      = var.ch_appgtw_subnet_id
  route_table_id = azurerm_route_table.route_table_ch_internet.id
  provider       = azurerm.app
}
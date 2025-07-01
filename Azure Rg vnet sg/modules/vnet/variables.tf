variable "vnet_name"       { 
    type = string 
}
variable "rg_name"         { 
    type = string 
}
variable "location"        { 
    type = string 
}
variable "subnet_prefixes" { 
    type = list(string) 
}
variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}
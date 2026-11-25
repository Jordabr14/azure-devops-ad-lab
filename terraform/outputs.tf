output "web_public_ips" {
  value = azurerm_public_ip.web[*].ip_address
}

output "web_private_ips" {
  value = azurerm_network_interface.web[*].private_ip_address
}

output "ad_public_ip" {
  value = azurerm_public_ip.ad.ip_address
}

output "ad_private_ip" {
  value = azurerm_network_interface.ad.private_ip_address
}

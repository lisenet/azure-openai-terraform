output "azure_openai_endpoint" {
  description = "The endpoint used to connect to the Cognitive Service Account."
  value       = azurerm_cognitive_account.main.endpoint
}

output "openai_primary_access_key" {
  description = "A primary access key which can be used to connect to the Cognitive Service Account."
  value       = azurerm_cognitive_account.main.primary_access_key
  sensitive   = true
}

output "openai_secondary_access_key" {
  description = "A secondary access key which can be used to connect to the Cognitive Service Account."
  value       = azurerm_cognitive_account.main.secondary_access_key
  sensitive   = true
}

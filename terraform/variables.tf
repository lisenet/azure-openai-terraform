variable "env_name" {
  description = "Environment name to use for resources"
  type        = string
  default     = "lisenet-openai"
}

variable "resource_group_location" {
  description = "Location of the resource group."
  type        = string
  default     = "uksouth"
}

variable "openai_model_name" {
  description = "Azure OpenAI model name."
  type        = string
  default     = "gpt-4o"
}

variable "openai_model_version" {
  description = "Azure OpenAI model version."
  type        = string
  default     = "2024-11-20"
}

variable "openai_tokens_per_minute" {
  description = "Tokens per minute (thousands)."
  type        = number
  default     = 1
}

# In version 4.0 of the Azure Provider, it is now required to specify
# the Azure Subscription ID when configuring a provider instance in
# your configuration.
variable "azure_subscription_id" {
  description = "Azure subscription ID to use to provision resources"
  type        = string
  validation {
    condition     = length(var.azure_subscription_id) == 36
    error_message = "Azure subscription ID must be 36 characters long."
  }
}

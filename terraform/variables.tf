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
  default     = "gpt-35-turbo"
}

variable "openai_model_version" {
  description = "Azure OpenAI model version."
  type        = string
  default     = "0301"
}

variable "openai_tokens_per_minute" {
  description = "Tokens per minute (thousands)."
  type        = number
  default     = 1
}

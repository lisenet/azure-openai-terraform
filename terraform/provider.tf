terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  features {
    application_insights {
      disable_generated_rule = true
    }
  }
  subscription_id = var.azure_subscription_id
}

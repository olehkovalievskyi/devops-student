terraform {
  required_providers {
    
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.108.0"
    }
    
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
    
  }
  
  backend "azurerm" {
    resource_group_name  = "student-group"
    storage_account_name = "tfstate74cf2554"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}
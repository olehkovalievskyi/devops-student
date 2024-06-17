terraform {
  required_providers {
    
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
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
  
  # backend "azurerm" {
  #   resource_group_name  = "devopsdevops-student"
  #   storage_account_name = "tfstate44be2df5"
  #   container_name       = "tfstate"
  #   key                  = "terraform.tfstate"
  #   use_oidc             = true
  # }
}
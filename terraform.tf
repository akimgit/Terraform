terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.71.0"
    }
  }
}
provider "azurerm" {
}
variable "cluster_suffix_name" {
  type = string
  validation {
    condition     = can(regex("^aks-\\d{2}$", var.cluster_suffix_name))
    error_message = "Nom de cluster incorrect, ne respecte pas la contrainte."
  }
}
variable "default_pool_name" {
  type = string
  default = "default"
  validation {
    condition     = can(regex("^[\\w\\d]*$", var.default_pool_name))
    error_message = "Nom de pool incorrect."
  }
}
variable "default_pool_vm_count" {
  type = number
  default = 1
  validation {
    condition     = var.default_pool_vm_count >= 1
    error_message = "Nombre d'instance incorrect."
  }
}
variable "default_pool_vm_size" {
  type = string
  default = "Standard_A2_v2"
  validation {
    condition     = contains(["Standard_A2_v2", "Standard_A4_v2"], var.default_pool_vm_size)
    error_message = "Type d'instance incorrect."
  }
}
locals {
  trigram = "aki"
}
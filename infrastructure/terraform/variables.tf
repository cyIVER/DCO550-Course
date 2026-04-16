# Terraform Variables for DCO 550 Cyber Range
# Author: Principal Cloud Architect

variable "student_num" {
  description = "Unique student ID for IP addressing and naming"
  type        = number
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "East US"
}

variable "hunter_image_id" {
  description = "Resource ID of the pre-built Hunter/Forensics golden image"
  type        = string
}

variable "admin_username" {
  description = "Default admin username for all lab VMs"
  type        = string
  default     = "hunter"
}

variable "admin_password" {
  description = "Default admin password for all lab VMs"
  type        = string
  sensitive   = true
}

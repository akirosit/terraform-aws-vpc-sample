variable "vpc_cidr" {
  type        = string
  description = "(Required) The IPv4 CIDR block for the VPC"
  nullable    = false
}

variable "subnet_count" {
  type        = number
  description = "(Optional) Number of subnets to create within the VPC. The value must be an integer between 0 and 256. Defaults `2`"
  default     = 2
  nullable    = false
  validation {
    condition     = var.subnet_count >= 0 && var.subnet_count <= 256
    error_message = "The subnet_count value must be an integer between 0 and 256"
  }
}

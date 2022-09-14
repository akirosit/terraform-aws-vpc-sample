variable "vpc_cidr" {
  type        = string
  description = "(Required) The IPv4 CIDR block for the VPC"
  nullable    = false
}

variable "subnets_cidr" {
  type        = list(string)
  description = "(Optional) List of CIDR blocks to be assigned to subnets within the VPC."
  default     = []
  nullable    = false
}

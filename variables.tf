variable "cddc_dedicated_host_name" {
  description = "The name of cddc dedicated host."
  type        = string
  default     = null
}

variable "dedicated_host_group_id" {
  description = "The group id of cddc dedicated host."
  type        = string
}

variable "host_class" {
  description = "The class of cddc dedicated host."
  type        = string
}

variable "zone_id" {
  description = "The zones id of dedicated host."
  type        = string
}

variable "vswitch_id" {
  description = "The vswitch id of cddc dedicated."
  type        = string
}

variable "payment_type" {
  description = "The payment type of cddc dedicated host."
  type        = string
  default     = "Subscription"
}

variable "image_category" {
  description = "The image category of cddc dedicated host."
  type        = string
  default     = "WindowsWithMssqlStdLicense"
}

variable "account_name" {
  description = "The account name of cddc dedicated host."
  type        = string
}

variable "account_password" {
  description = "The account password of cddc dedicated host."
  type        = string
}

variable "account_type" {
  description = "The account type of cddc dedicated host."
  type        = string
  default     = "Normal"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "create" {
  description = "Whether to create resources in module."
  type        = bool
  default     = false
}



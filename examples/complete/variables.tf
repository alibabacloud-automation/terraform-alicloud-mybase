#alicloud_cddc_dedicated_host
variable "cddc_dedicated_host_name" {
  description = "The name of cddc dedicated host."
  type        = string
  default     = "tf-testacc-name"
}

variable "image_category" {
  description = "The image category of cddc dedicated host."
  type        = string
  default     = "WindowsWithMssqlStdLicense"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    Name = "MYBASE"
  }
}

#alicloud_cddc_dedicated_host_account
variable "account_password" {
  description = "The account password of cddc dedicated host."
  type        = string
  default     = "YourPassword123!"
}
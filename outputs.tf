output "this_cddc_dedicated_host" {
  description = "The dedicated host of CDDC."
  value       = concat(alicloud_cddc_dedicated_host.cddc_dedicated_host.*.id, [""])[0]
}

output "this_cddc_dedicated_host_account" {
  description = "The account of cddc dedicated host."
  value       = concat(alicloud_cddc_dedicated_host_account.cddc_dedicated_host_account.*.id, [""])[0]
}
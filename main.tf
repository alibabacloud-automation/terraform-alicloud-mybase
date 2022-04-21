resource "alicloud_cddc_dedicated_host" "cddc_dedicated_host" {
  count                   = var.create ? 1 : 0
  host_name               = var.cddc_dedicated_host_name
  dedicated_host_group_id = var.dedicated_host_group_id
  host_class              = var.host_class
  zone_id                 = var.zone_id
  vswitch_id              = var.vswitch_id
  payment_type            = var.payment_type
  image_category          = var.image_category
  tags                    = var.tags
}

resource "alicloud_cddc_dedicated_host_account" "cddc_dedicated_host_account" {
  count             = var.create ? 1 : 0
  dedicated_host_id = alicloud_cddc_dedicated_host.cddc_dedicated_host.0.dedicated_host_id
  account_name      = var.account_name
  account_password  = var.account_password
  account_type      = var.account_type
}
data "alicloud_cddc_zones" "default" {
}

data "alicloud_cddc_dedicated_host_groups" "default" {
  engine = "MySQL"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_cddc_zones.default.zones.0.id
}

data "alicloud_cddc_host_ecs_level_infos" "default" {
  db_type        = "mssql"
  zone_id        = data.alicloud_cddc_zones.default.zones.0.id
  storage_type   = "cloud_essd"
  image_category = var.image_category
}

module "example" {
  source = "../.."

  #alicloud_cddc_dedicated_host
  create = true

  cddc_dedicated_host_name = var.cddc_dedicated_host_name
  dedicated_host_group_id  = data.alicloud_cddc_dedicated_host_groups.default.groups.0.id
  host_class               = data.alicloud_cddc_host_ecs_level_infos.default.infos.0.res_class_code
  zone_id                  = data.alicloud_cddc_zones.default.zones.0.id
  vswitch_id               = data.alicloud_vswitches.default.vswitches.0.id
  payment_type             = "Subscription"
  image_category           = var.image_category
  tags                     = var.tags

  #alicloud_cddc_dedicated_host_account
  account_name     = "tf_testacc_name"
  account_password = var.account_password
  account_type     = "Normal"

}
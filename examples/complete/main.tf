variable "name" {
  default = "tftestacc"
}

data "alicloud_cddc_dedicated_host_groups" "default" {
  name_regex = var.name
  engine     = "mssql"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

resource "alicloud_cddc_dedicated_host_group" "default" {
  count                     = length(data.alicloud_cddc_dedicated_host_groups.default.ids) > 0 ? 0 : 1
  engine                    = "SQLServer"
  vpc_id                    = data.alicloud_vpcs.default.ids.0
  allocation_policy         = "Evenly"
  host_replace_policy       = "Manual"
  dedicated_host_group_desc = var.name
  open_permission           = true
}

data "alicloud_vswitches" "default" {
  vpc_id  = length(data.alicloud_cddc_dedicated_host_groups.default.ids) > 0 ? data.alicloud_cddc_dedicated_host_groups.default.groups[0].vpc_id : data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_cddc_zones.default.ids.0
}

data "alicloud_cddc_zones" "default" {}

resource "alicloud_vswitch" "default" {
  count      = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id     = data.alicloud_vpcs.default.ids.0
  cidr_block = data.alicloud_vpcs.default.vpcs[0].cidr_block
  zone_id    = data.alicloud_cddc_zones.default.ids.0
}

data "alicloud_cddc_host_ecs_level_infos" "default" {
  db_type        = "mssql"
  zone_id        = data.alicloud_cddc_zones.default.ids.0
  storage_type   = "cloud_essd"
  image_category = "WindowsWithMssqlStdLicense"
}

module "example" {
  source = "../.."
  create = true
  cddc_dedicated_host_name = "dedicatedHostName"
  account_name = var.name
  account_password = "yourpassword"
  dedicated_host_group_id = length(data.alicloud_cddc_dedicated_host_groups.default.ids) > 0 ? data.alicloud_cddc_dedicated_host_groups.default.ids.0 : alicloud_cddc_dedicated_host_group.default[0].id
  host_class = data.alicloud_cddc_host_ecs_level_infos.default.infos.0.res_class_code
  zone_id = data.alicloud_cddc_zones.default.ids.0
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : alicloud_vswitch.default[0].id
}
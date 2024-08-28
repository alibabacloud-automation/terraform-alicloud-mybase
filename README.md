# Deprecated

Thank you for your interest in Alibaba Cloud Terraform Module. Due to the [end of sale for Managed MyBase](https://www.alibabacloud.com/help/en/apsaradb-for-mybase/latest/notice-stop-selling-mybase-hosted-instances-from-august-31-2023), this Module will be out of maintenance as of today and will be officially taken offline in the future. More available Modules can be searched in [Alibaba Cloud Terraform Module](https://registry.terraform.io/browse/modules?provider=alibaba).

Thank you again for your understanding and cooperation.

Terraform module which creates Mybase and its account on Alibaba Cloud.

terraform-alicloud-mybase
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-mybase/blob/master/README-CN.md)

Terraform module which creates Mybase and its account on Alibaba Cloud.

These types of resources are supported:

* [Cddc_Dedicated_Host](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cddc_dedicated_host)
* [Cddc_Dedicated_Host_Account](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cddc_dedicated_host_account)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.131.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.131.0 |

## Usage

```hcl
module "example" {
  source = "terraform-alicloud-modules/mybase/alicloud"
  create = true
  cddc_dedicated_host_name = "dedicatedHostName"
  account_name = var.name
  account_password = "yourpassword"
  dedicated_host_group_id = length(data.alicloud_cddc_dedicated_host_groups.default.ids) > 0 ? data.alicloud_cddc_dedicated_host_groups.default.ids.0 : alicloud_cddc_dedicated_host_group.default[0].id
  host_class = data.alicloud_cddc_host_ecs_level_infos.default.infos.0.res_class_code
  zone_id = data.alicloud_cddc_zones.default.ids.0
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : alicloud_vswitch.default[0].id
}
```

Submit Issues
-------------
If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
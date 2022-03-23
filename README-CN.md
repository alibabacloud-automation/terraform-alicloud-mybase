terraform-alicloud-mybase
=====================================================================

本 Module 用于在阿里云创建一个[云数据库专享集群(Mybase)](https://help.aliyun.com/product/156215.html).

本 Module 支持创建以下资源:

* [云数据库专享集群(Cddc_Dedicated_Host)](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cddc_dedicated_host)
* [云数据库专享集群账户(Cddc_Dedicated_Host_Account)](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cddc_dedicated_host_account)

## 版本要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.131.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.131.0 |

## 用法

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

提交问题
------
如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
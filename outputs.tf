output "lakeformation_resource_lf_tags_id" {
  description = "Map of id values across all lakeformation_resource_lf_tags, keyed the same as var.lakeformation_resource_lf_tags"
  value       = { for k, v in aws_lakeformation_resource_lf_tags.lakeformation_resource_lf_tags : k => v.id if v.id != null && length(v.id) > 0 }
}
output "lakeformation_resource_lf_tags_catalog_id" {
  description = "Map of catalog_id values across all lakeformation_resource_lf_tags, keyed the same as var.lakeformation_resource_lf_tags"
  value       = { for k, v in aws_lakeformation_resource_lf_tags.lakeformation_resource_lf_tags : k => v.catalog_id if v.catalog_id != null && length(v.catalog_id) > 0 }
}
output "lakeformation_resource_lf_tags_database" {
  description = "Map of database values across all lakeformation_resource_lf_tags, keyed the same as var.lakeformation_resource_lf_tags"
  value       = { for k, v in aws_lakeformation_resource_lf_tags.lakeformation_resource_lf_tags : k => one(v.database) if v.database != null && length(v.database) > 0 }
}
output "lakeformation_resource_lf_tags_lf_tag" {
  description = "Map of lf_tag values across all lakeformation_resource_lf_tags, keyed the same as var.lakeformation_resource_lf_tags"
  value       = { for k, v in aws_lakeformation_resource_lf_tags.lakeformation_resource_lf_tags : k => v.lf_tag if v.lf_tag != null && length(v.lf_tag) > 0 }
}
output "lakeformation_resource_lf_tags_region" {
  description = "Map of region values across all lakeformation_resource_lf_tags, keyed the same as var.lakeformation_resource_lf_tags"
  value       = { for k, v in aws_lakeformation_resource_lf_tags.lakeformation_resource_lf_tags : k => v.region if v.region != null && length(v.region) > 0 }
}
output "lakeformation_resource_lf_tags_table" {
  description = "Map of table values across all lakeformation_resource_lf_tags, keyed the same as var.lakeformation_resource_lf_tags"
  value       = { for k, v in aws_lakeformation_resource_lf_tags.lakeformation_resource_lf_tags : k => one(v.table) if v.table != null && length(v.table) > 0 }
}
output "lakeformation_resource_lf_tags_table_with_columns" {
  description = "Map of table_with_columns values across all lakeformation_resource_lf_tags, keyed the same as var.lakeformation_resource_lf_tags"
  value       = { for k, v in aws_lakeformation_resource_lf_tags.lakeformation_resource_lf_tags : k => one(v.table_with_columns) if v.table_with_columns != null && length(v.table_with_columns) > 0 }
}


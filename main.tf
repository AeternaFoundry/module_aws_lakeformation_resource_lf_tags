resource "aws_lakeformation_resource_lf_tags" "lakeformation_resource_lf_tags" {
  for_each = var.lakeformation_resource_lf_tags

  catalog_id = each.value.catalog_id
  region     = each.value.region

  dynamic "lf_tag" {
    for_each = each.value.lf_tag
    content {
      catalog_id = lf_tag.value.catalog_id
      key        = lf_tag.value.key
      value      = lf_tag.value.value
    }
  }

  dynamic "database" {
    for_each = each.value.database != null ? [each.value.database] : []
    content {
      catalog_id = database.value.catalog_id
      name       = database.value.name
    }
  }

  dynamic "table" {
    for_each = each.value.table != null ? [each.value.table] : []
    content {
      catalog_id    = table.value.catalog_id
      database_name = table.value.database_name
      name          = table.value.name
      wildcard      = table.value.wildcard
    }
  }

  dynamic "table_with_columns" {
    for_each = each.value.table_with_columns != null ? [each.value.table_with_columns] : []
    content {
      catalog_id            = table_with_columns.value.catalog_id
      column_names          = table_with_columns.value.column_names
      database_name         = table_with_columns.value.database_name
      excluded_column_names = table_with_columns.value.excluded_column_names
      name                  = table_with_columns.value.name
      wildcard              = table_with_columns.value.wildcard
    }
  }
}


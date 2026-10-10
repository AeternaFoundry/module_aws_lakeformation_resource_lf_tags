variable "lakeformation_resource_lf_tags" {
  description = <<EOT
Map of lakeformation_resource_lf_tags, attributes below
Required:
    - lf_tag (block):
        - catalog_id (optional)
        - key (required)
        - value (required)
Optional:
    - catalog_id
    - region
    - database (block):
        - catalog_id (optional)
        - name (required)
    - table (block):
        - catalog_id (optional)
        - database_name (required)
        - name (optional)
        - wildcard (optional)
    - table_with_columns (block):
        - catalog_id (optional)
        - column_names (optional)
        - database_name (required)
        - excluded_column_names (optional)
        - name (required)
        - wildcard (optional)
EOT

  type = map(object({
    catalog_id = optional(string)
    region     = optional(string)
    lf_tag = list(object({
      catalog_id = optional(string)
      key        = string
      value      = string
    }))
    database = optional(object({
      catalog_id = optional(string)
      name       = string
    }))
    table = optional(object({
      catalog_id    = optional(string)
      database_name = string
      name          = optional(string)
      wildcard      = optional(bool)
    }))
    table_with_columns = optional(object({
      catalog_id            = optional(string)
      column_names          = optional(set(string))
      database_name         = string
      excluded_column_names = optional(set(string))
      name                  = string
      wildcard              = optional(bool)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.lakeformation_resource_lf_tags : (
        length(v.lf_tag) >= 1
      )
    ])
    error_message = "Each lf_tag list must contain at least 1 items"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


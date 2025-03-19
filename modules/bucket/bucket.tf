resource "oci_objectstorage_bucket" "backup_bucket" {
  compartment_id = var.object_storage_compartment_id
  name           = var.bucket_name
  namespace      = var.bucket_namespace
  access_type = var.access_type
  
  auto_tiering = var.auto_tiering
  storage_tier       = var.storage_tier
  
  versioning        = var.versioning
  object_events_enabled = var.object_events_enabled
  
  kms_key_id = var.kms_key_id


  dynamic "retention_rules" {
    for_each = var.retention_rules
    content {
      display_name = retention_rules.value.display_name
      duration {
        time_amount = retention_rules.value.time_amount
        time_unit   = retention_rules.value.time_unit
      }
      time_rule_locked = retention_rules.value.time_rule_locked
    }
  }

metadata          = var.bucket_metadata
/*
defined_tags = var.defined_tags
*/
freeform_tags = var.freeform_tags


}
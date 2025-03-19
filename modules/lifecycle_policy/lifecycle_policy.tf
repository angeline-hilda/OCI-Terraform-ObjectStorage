resource "oci_objectstorage_object_lifecycle_policy" "policy" {
  bucket    = var.bucket_name
  namespace = var.bucket_namespace

#optional
  rules {
    #Required
    action     = var.action
    is_enabled = var.is_enabled
    name       = var.rule_name
    time_amount = var.time_amount
    time_unit  = var.time_unit
    target     = var.target

    #optional
    object_name_filter {
      exclusion_patterns = var.exclusion_patterns
      inclusion_patterns = var.inclusion_patterns
      inclusion_prefixes = var.inclusion_prefixes
    }
  }
}

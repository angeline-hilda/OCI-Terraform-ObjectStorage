resource "oci_objectstorage_replication_policy" "replication_policy" {
  bucket                   = var.source_bucket_name
  destination_bucket_name  = var.destination_bucket_name
  destination_region_name  = var.destination_region_name
  name                     = var.replication_policy_name
  namespace                = var.namespace
}

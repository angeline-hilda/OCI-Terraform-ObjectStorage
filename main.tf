data "oci_objectstorage_namespace" "test_namespace" {
  
}

module "oci_objectstorage" {
  source = "./modules/bucket"
  object_storage_compartment_id = var.compartment_id
  bucket_name = var.bucket_name
  bucket_namespace =  data.oci_objectstorage_namespace.test_namespace.namespace
  storage_tier = var.storage_tier

  access_type = var.bucket_access_type
  auto_tiering = var.bucket_auto_tiering

  versioning        = var.bucket_versioning
  object_events_enabled = var.bucket_object_events_enabled

  retention_rules = var.retention_rules
    
  kms_key_id = var.kms_key_id

  providers = {
    oci             = oci
    oci.home_region = oci.home_region
  }
}

module "object_lifecycle" {

  depends_on = [ module.oci_objectstorage ]
  source = "./modules/lifecycle_policy"
  bucket_name = var.bucket_name
  bucket_namespace =  data.oci_objectstorage_namespace.test_namespace.namespace
  action      = var.action
  is_enabled  = var.is_enabled
  rule_name   = var.rule_name
  time_amount = var.time_amount
  time_unit   = var.time_unit
  target      = var.target

  inclusion_patterns = var.inclusion_patterns
  exclusion_patterns = var.exclusion_patterns
 
 providers = {
    oci             = oci
    oci.home_region = oci.home_region
  }
  
}

module "replication_policy" {
  source = "./modules/replication"
  source_bucket_name             = var.source_bucket_name
  destination_bucket_name = var.destination_bucket_name
  destination_region_name = var.destination_region_name
  replication_policy_name = var.replication_policy_name
  namespace               = data.oci_objectstorage_namespace.test_namespace.namespace

 providers = {
    oci             = oci
    oci.home_region = oci.home_region
  }

}
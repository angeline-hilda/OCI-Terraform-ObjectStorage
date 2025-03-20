output "bucket_name" {
  description = "The name of the created bucket."
  value       = module.oci_objectstorage.bucket_name
}

output "namespace" {
  description = "The namespace of the bucket."
  value       = module.oci_objectstorage.namespace

}

output "bucket_id" {

  description = "The OCID of the created bucket."
  value       = module.oci_objectstorage.bucket_id
}
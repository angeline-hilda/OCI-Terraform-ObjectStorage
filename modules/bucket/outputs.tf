output "bucket_id" {

  description = "The OCID of the created bucket."
  value = oci_objectstorage_bucket.backup_bucket.id
}

output "bucket_name" {
    description = "The name of the created bucket."
    value = oci_objectstorage_bucket.backup_bucket.name
  
}

output "namespace" {
description = "The namespace of the bucket."
value = oci_objectstorage_bucket.backup_bucket.namespace

}

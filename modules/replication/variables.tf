variable "source_bucket_name" {
  description = "The name of the bucket to enable replication on."
  type        = string
}

variable "destination_bucket_name" {
  description = "The name of the destination bucket in the target region."
  type        = string
}

variable "destination_region_name" {
  description = "The target region where the bucket should be replicated."
  type        = string
}

variable "replication_policy_name" {
  description = "A unique name for the replication policy."
  type        = string
}

variable "namespace" {
  description = "The Object Storage namespace for the request."
  type        = string
}
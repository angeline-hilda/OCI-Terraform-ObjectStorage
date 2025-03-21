variable "object_storage_compartment_id" {
  type        = string
  description = "The OCID of the compartment"
}



variable "bucket_namespace" {
  type        = string
  description = "The Object Storage namespace"
}


variable "bucket_name" {
  description = "The name of the OCI Object Storage bucket. Must be unique within the namespace."
  type        = string
}
variable "storage_tier" {
  
}

variable "kms_key_id" {
  description = "OCID of the KMS key used for encryption in OCI Vault."
  type        = string
  
}



variable "access_type" {
  description = "The type of public access for the bucket (NoPublicAccess, ObjectRead, ObjectReadWithoutList)."
  type        = string
  default     = "NoPublicAccess"
}

variable "auto_tiering" {
  description = "Auto tiering status (Disabled, InfrequentAccess)."
  type        = string
  default     = "Disabled"
}

variable "versioning" {
  description = "Set the versioning status (Enabled, Suspended, Disabled)."
  type        = string
  default     = "Disabled"
}

variable "object_events_enabled" {
  description = "Enable object state change events (true/false)."
  type        = bool
  default     = false
}

variable "retention_rules" {
  description = "List of retention rules for the bucket."
  type = list(object({
    display_name = string
    time_amount  = number
    time_unit    = string
    time_rule_locked = optional(string, null)
  }))
  default = []
}


variable "bucket_metadata" {
  description = "Metadata for the bucket."
  type        = map(string)
  default     = {}
}

/*
variable "defined_tags" {
  description = "Defined tags for the bucket."
  type        = map(string)
  #default     = {}
}
*/

variable "freeform_tags" {
  description = "Freeform tags for the bucket."
  type        = map(string)
  default     = {}
}




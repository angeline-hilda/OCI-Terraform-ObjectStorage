
variable "bucket_name" {
    description = "The name of the OCI Object Storage bucket. Must be unique within the namespace."
    type = string
  
}

variable "storage_tier" {
    description = "Defines the storage tier for OCI Object Storage. Options: 'Standard' or 'Archive'."
    type= string
    default = "Standard"

    validation {
    condition     = var.storage_tier == "Standard" || var.storage_tier == "Archive"
    error_message = "Allowed values are 'Standard' or 'Archive'."
  }
  
}

variable "kms_key_id" {
    description = "OCID of the KMS key used for encryption in OCI Vault."
    type        = string
  
}

variable "bucket_access_type" {
  description = "The type of public access for the bucket (NoPublicAccess, ObjectRead, ObjectReadWithoutList)."
  type        = string
  default     = "NoPublicAccess"
}

variable "bucket_auto_tiering" {
  description = "Auto tiering status (Disabled, InfrequentAccess)."
  type        = string
  default     = "Disabled"
}

variable "bucket_versioning" {
  description = "Set the versioning status (Enabled, Suspended, Disabled)."
  type        = string
  default     = "Disabled"
}

variable "bucket_object_events_enabled" {
  description = "Enable object state change events (true/false)."
  type        = bool
  default     = false
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



###############################################################################
#             Lifecycle policy 
#############################################################################

variable "action" {
  description = "The action of the lifecycle rule (DELETE, ARCHIVE, INFREQUENT_ACCESS, ABORT)."
  type        = string
}

variable "is_enabled" {
  description = "Whether the rule is enabled or not."
  type        = bool
  default     = true
}

variable "rule_name" {
  description = "The name of the lifecycle policy rule."
  type        = string
}

variable "time_amount" {
  description = "Specifies the age of objects to apply the rule to."
  type        = number
}

variable "time_unit" {
  description = "The unit to interpret time_amount (DAYS, YEARS)."
  type        = string
}

variable "target" {
  description = "The target of the lifecycle policy (objects, multipart-uploads, previous-object-versions)."
  type        = string
}

variable "exclusion_patterns" {
  description = "Glob patterns to exclude objects from the rule."
  type        = list(string)
  default     = []
}

variable "inclusion_patterns" {
  description = "Glob patterns to include objects in the rule."
  type        = list(string)
  default     = []
}

variable "inclusion_prefixes" {
  description = "Prefixes of objects the rule should apply to."
  type        = list(string)
  default     = []
}





###############################################################
#                 Replication Policy 
###############################################################


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
variable "bucket_namespace" {
  type        = string
  description = "The Object Storage namespace"
}


variable "bucket_name" {
    description = "The name of the OCI Object Storage bucket. Must be unique within the namespace."
    type        = string

}
  

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


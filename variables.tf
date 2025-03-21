# -----------------------------------------------------------------------------
# Common Variables
# -----------------------------------------------------------------------------
variable "tenancy_id" {
  type        = string
  description = "The OCID of tenancy"
}

variable "home_region" {
  type        = string
  description = "The OCI home region"

}

variable "region" {
  type        = string
  description = "The OCI region"
}

variable "compartment_id" {
  type        = string
  description = "The OCID of the compartment"

}

variable "user_id" {
  type        = string
  description = "The user OCID"

}

variable "api_fingerprint" {
  type        = string
  description = "The fingerprint of the public key uploaded to OCI for API authentication"
}

variable "api_private_key_path" {
  type        = string
  description = "The file path to the private key used for OCI API authentication"
}



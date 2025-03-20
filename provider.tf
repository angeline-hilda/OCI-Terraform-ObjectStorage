# # -----------------------------------------------------------------------------
# # Provider Requirements if using stack as a module
# # -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# Support for multi-region deployments
# -----------------------------------------------------------------------------

data "oci_identity_region_subscriptions" "regions" {
  tenancy_id = var.tenancy_id
}

terraform {
  required_version = "1.9.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">=6.24.0"
    }
    /*
    backend "s3" {
    bucket                    = "terraaform_backend"
    region                    = "us-ashburn-1"
    key                       = "tf.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    use_path_style              = true
    skip_s3_checksum            = true
    skip_metadata_api_check = true
    access_key = ""
    secret_key = ""


    endpoints = {
      s3 = "https://sehubjapaciaas.compat.objectstorage.us-ashburn-1.oraclecloud.com"
    }
 }
 */

  }

}

provider "oci" {
  tenancy_ocid = var.tenancy_id
  user_ocid    = var.user_id
  region       = var.region
}
provider "oci" {
  alias        = "home_region"
  tenancy_ocid = var.tenancy_id
  user_ocid    = var.user_id
  region       = var.home_region
}







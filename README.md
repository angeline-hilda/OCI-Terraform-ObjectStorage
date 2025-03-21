# Oracle Cloud Infrastructure Terraform Module for Object Storage

This OpenTofu/Terraform module provisions and configures Oracle Cloud Infrastructure (OCI) Object Storage resources, including:

- Object Storage bucket

- Replication policy

- Lifecycle policy

- [Bucket access logs](https://github.com/angeline-hilda/OCI-Terraform-Logging/tree/master)

## Pre-requisites

Ensure you have the following before using this module:

- [OpenTofu](https://opentofu.org/docs/intro/install/) or [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) installed
- An Oracle Cloud Infrastruture(OCI) Account
- [Configure OCI CLI](https://docs.oracle.com/en-us/iaas/Content/dev/terraform/tutorials/tf-provider.htm#prepare) with appropriate credentials
- Required IAM policies for user permissions [Object Storage](https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/commonpolicies.htm#object-storage-admins-manage-buckets-objects) and service permissions [Lifecycle Management](https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/usinglifecyclepolicies.htm#Service), [Auto-tiering](https://docs.oracle.com/en-us/iaas/Content/Object/Concepts/understandingstoragetiers.htm#auto_tiering) and [Replication](https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/usingreplication.htm#permissions)

## Features and Resources
### Object Storage Bucket
Creates an Object Storage bucket with optional versioning and auto-tiering. 

### Object Versioning
Enables object versioning to retain previous versions of objects. This helps in retrieving and recovering previous versions, protecting against accidental or malicious overwrites and deletions.

### Auto-tiering
If enabled, helps reduce storage costs by automatically moving objects between the Standard and Infrequent Access storage tiers based on data access patterns. 

### Retention Rules
Applies retention rules at the bucket level to provide immutable object storage for regulatory compliance and legal requirements.

### Replication Policy
If enabled, configures automatic replication of objects from one Object Storage bucket to another, either in the same region or across different regions.

### Lifecycle Policy
Defines rules for automatic management of objects, such as archiving or deleting objects after a specified period.

### Bucket Access Logs
Stores read/write access logs for auditing and tracking.


> **Note:** Before enabling these features, check their [interaction with other Object Storage features](#Documentation). Not all features can be enabled simultaneously, and some may have dependencies or limitations when used together.


## Using with Terraform

This module is compatible with OpenTofu. To use Terraform instead of OpenTofu, ensure you have Terraform installed and use the following provider configuration:

```hcl

terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = ">= 6.31.0"
    }
  }
}

```

## Deploy using OpenTofu or Terraform

1. Use `terraform.tfvars` File

   The repository includes a terraform.tfvars.example file. Edit it and replace the placeholder values with your actual OCI credentials, to create your own terraform.tfvars file.
   
3. To deploy the resources, initialize and apply the configuration:

```sh
tofu init  # or terraform init
tofu plan  # or terraform plan
tofu apply # or terraform apply
```

## Cleanup
To destroy the created resources, use:

```sh
tofu destroy # or terraform destroy
```

## Documentation
- [OCI Terraform](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/objectstorage_object)
- [OCI Object Storage](https://docs.oracle.com/en-us/iaas/Content/Object/Concepts/objectstorageoverview.htm)
- [OCI Retention](https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/usingretentionrules.htm#FeatureInteraction)
- [OCI Auto-tiering](https://docs.oracle.com/en-us/iaas/Content/Object/Concepts/understandingstoragetiers.htm#auto_tiering)
- [OCI Object Versioning](https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/usingversioning.htm#ScopeVersioning)

## License

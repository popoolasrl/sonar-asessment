variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "The canned ACL to apply to the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket for destroy"
  type        = bool
}

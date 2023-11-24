resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = var.acl

  versioning {
    enabled = var.versioning
  }

  force_destroy = var.force_destroy

  
}

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
  description = "A boolean that indicates all objects (including all versions) should be deleted from the bucket so that the bucket can be destroyed without error"
  type        = bool
}



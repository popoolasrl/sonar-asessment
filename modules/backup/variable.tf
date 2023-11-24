variable "backup_vault_name" {
  description = "Name of the AWS Backup vault"
  type        = string
}

variable "backup_plan_name" {
  description = "Name of the AWS Backup plan"
  type        = string
}

variable "backup_rule_name" {
  description = "Name of the AWS Backup rule"
  type        = string
}

variable "backup_role_name" {
  description = "Name of the AWS Backup IAM role"
  type        = string
}

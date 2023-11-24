resource "aws_backup_vault" "sonar-vault" {
  name = var.backup_vault_name
}

resource "aws_backup_plan" "sonar-backuplan" {
  name = var.backup_plan_name

  rule {
    rule_name         = var.backup_rule_name
    target_vault_name = aws_backup_vault.sonar-vault.name
    schedule          = "cron(0 12 * * ? *)"
    lifecycle {
      delete_after = 7 # delete after 7 days
    }
  }
}

resource "aws_backup_selection" "sonar-bkpselection" {
  name        = "sonar_backup_selection"
  iam_role_arn = aws_iam_role.backup-sonar-role.arn
  plan_id     = aws_backup_plan.sonar-backuplan.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "env"
    value = "dev"
  }
}

resource "aws_iam_role" "backup-sonar-role" {
  name             = var.backup_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "backup.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "backup" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.backup-sonar-role.name
}

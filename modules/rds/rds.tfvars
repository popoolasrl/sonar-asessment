project_name = [
  "three-tier-architecture"
]

environment = [
  "dev"
]

engine_name = [
  "aurora-mysql"
]

engine_version = [
  "5.7.mysql_aurora.2.07.9"
]

storage = [
  "500"
]

identifier = [
  "db-aurora-mysql-dev"
]

instance_class = [
  "db.t3.medium"
]

multi_az = [
  "true"
]

availability_zones = [
  ["us-west-2a", "us-west-2b", "us-west-2c"]
]


database_name = [
  "dbmysql"
]

database_username = [
  "dbadmin"
]

database_password = [
  "S0methingS3cure!"
]

database_port = [
  "3306"
]

publicly_accessible = [
  "false"
]

database_snapshot = [
  "true"
]

db_subnet_group_name = [
  "aws_db_subnet_group.main.id"
]

db_security_group = [
  "aws_security_group.db_security_group.id"
]

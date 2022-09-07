provider "aws" {
  region = "eu-west-2"
}

################################################################################
# Compliant Cluster - With Audit Logging
################################################################################

# resource "aws_db_instance" "nibr-bot13-dbinstance-c" {
#   identifier = "nibr-bot13-dbinstance-c"
#   allocated_storage    = 5
#   instance_class       = "db.t3.micro"
#   engine               = "mysql"
#   db_name              = "nibrbot13testdbC"
#   username             = "nibrbottester"
#   password             = var.db_password
#   db_subnet_group_name = "nibr-bot13-rds-dbinstance-sg"
#   publicly_accessible  = false
#   storage_encrypted    = true
#   iam_database_authentication_enabled = true
#   port                 = 3306
#   skip_final_snapshot  = true
#   delete_automated_backups = true
#   enabled_cloudwatch_logs_exports = audit
# }

##################################################################################
# Non-Compliant Cluster - Without Audit Logging - Aurora-MySQL
##################################################################################

resource "aws_rds_cluster" "nibr-bot13-aurora-mysql-cluster" {
  cluster_identifier = "nibr-bot13-aurora-mysql-cluster"
  db_subnet_group_name = "nibr-bot13-rds-dbinstance-sg"
  availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  engine             = "aurora-mysql"
  database_name      = "nibrbot13testdbauroramysql"
  master_username    = "nibrbottester"
  master_password    = var.db_password
  iam_database_authentication_enabled = true
  storage_encrypted    = true
  port                 = 3306
  skip_final_snapshot  = true
  apply_immediately    = true
}

resource "aws_rds_cluster_instance" "nibr-bot13-dbinstance-aurora-mysql" {
  count                = 1
  cluster_identifier   = aws_rds_cluster.nibr-bot13-aurora-mysql-cluster.id
  identifier           = "nibr-bot13-dbinstance-aurora-mysql"
  instance_class       = "db.t3.small"
  engine               = "aurora-mysql"
  db_subnet_group_name = "nibr-bot13-rds-dbinstance-sg"
  publicly_accessible  = false
  apply_immediately    = true
# allocated_storage    = Not applicable. Aurora cluster volumes automatically grow as the amount of data in your database increases.
# delete_automated_backups = Not applicable.
}

##################################################################################
# Non-Compliant Cluster - Without Audit Logging - Aurora-PostgreSQL
##################################################################################

resource "aws_rds_cluster" "nibr-bot13-aurora-postgresql-cluster" {
  cluster_identifier = "nibr-bot13-aurora-postgresql-cluster"
  db_subnet_group_name = "nibr-bot13-rds-dbinstance-sg"
  availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  engine             = "aurora-postgresql"
  database_name      = "nibrbot13testdbaurorapostgresql"
  master_username    = "nibrbottester"
  master_password    = var.db_password
  iam_database_authentication_enabled = true
  storage_encrypted    = true
  port                 = 3306
  skip_final_snapshot  = true
  apply_immediately    = true
}

resource "aws_rds_cluster_instance" "nibr-bot13-dbinstance-aurora-postgresql" {
  count                = 1
  cluster_identifier   = aws_rds_cluster.nibr-bot13-aurora-postgresql-cluster.id
  identifier           = "nibr-bot13-dbinstance-aurora-postgresql"
  instance_class       = "db.t3.medium"
  engine               = "aurora-postgresql"
  db_subnet_group_name = "nibr-bot13-rds-dbinstance-sg"
  publicly_accessible  = false
  apply_immediately    = true
# delete_automated_backups = Not applicable.
}

################################################################################
# Non-Compliant Instance - Without Audit Logging - MySQL
################################################################################

resource "aws_db_instance" "nibr-bot13-dbinstance-mysql" {
  identifier           = "nibr-bot13-dbinstance-mysql"
  instance_class       = "db.t3.micro"
  allocated_storage    = 5
  engine               = "mysql"
  db_name              = "nibrbot13testdbmysql"
  username             = "nibrbottester"
  password             = var.db_password
  db_subnet_group_name = "nibr-bot13-rds-dbinstance-sg"
  publicly_accessible  = false
  storage_encrypted    = true
  iam_database_authentication_enabled = true
  port                 = 3306
  skip_final_snapshot  = true
  delete_automated_backups = true
  apply_immediately    = true
}

################################################################################
# Non-Compliant Instance - Without Audit Logging - MariaDB
################################################################################

resource "aws_db_instance" "nibr-bot13-dbinstance-mariadb" {
  identifier           = "nibr-bot13-dbinstance-mariadb"
  instance_class       = "db.t3.micro"
  allocated_storage    = 5
  engine               = "mariadb"
  db_name              = "nibrbot13testdbmariadb"
  username             = "nibrbottester"
  password             = var.db_password
  db_subnet_group_name = "nibr-bot13-rds-dbinstance-sg"
  publicly_accessible  = false
  storage_encrypted    = true
  iam_database_authentication_enabled = true
  port                 = 3306
  skip_final_snapshot  = true
  delete_automated_backups = true
  apply_immediately    = true
}

################################################################################
# Non-Compliant Instance - Without Audit Logging - PostgreSQL
################################################################################

resource "aws_db_instance" "nibr-bot13-dbinstance-postgresql" {
  identifier           = "nibr-bot13-dbinstance-postgresql"
  instance_class       = "db.t3.micro"
  allocated_storage    = 5
  engine               = "postgres"
  db_name              = "nibrbot13testdbpostgresql"
  username             = "nibrbottester"
  password             = var.db_password
  db_subnet_group_name = "nibr-bot13-rds-dbinstance-sg"
  publicly_accessible  = false
  storage_encrypted    = true
  iam_database_authentication_enabled = true
  port                 = 3306
  skip_final_snapshot  = true
  delete_automated_backups = true
  apply_immediately    = true
}

################################################################################
# Non-Compliant Instance - Without Audit Logging - Oracle
################################################################################

resource "aws_db_instance" "nibr-bot13-dbinstance-oracle" {
  identifier           = "nibr-bot13-dbinstance-oracle"
  instance_class       = "db.t3.small"
  allocated_storage    = 100
  engine               = "oracle-se2"
  license_model        = "bring-your-own-license"
  db_name              = "BOT13"
  username             = "nibrbottester"
  password             = var.db_password
  db_subnet_group_name = "nibr-bot13-rds-dbinstance-sg"
  publicly_accessible  = false
  storage_encrypted    = true
# iam_database_authentication_enabled = Error creating DB Instance: InvalidParameterCombination: IAM Database Authentication is not supported for this configuration.
  port                 = 3306
  skip_final_snapshot  = true
  delete_automated_backups = true
  apply_immediately    = true
}

################################################################################
# Non-Compliant Instance - Without Audit Logging - MSSQL Standard Edition
################################################################################

resource "aws_db_instance" "nibr-bot13-dbinstance-sqlserver-se" {
  identifier           = "nibr-bot13-dbinstance-sqlserver-se"
  instance_class       = "db.t3.xlarge"
  allocated_storage    = 20
  engine               = "sqlserver-se"
  license_model        = "license-included"
  username             = "nibrbottester"
  password             = var.db_password
  db_subnet_group_name = "nibr-bot13-rds-dbinstance-sg"
  publicly_accessible  = false
  storage_encrypted    = true
  port                 = 1433
  skip_final_snapshot  = true
  delete_automated_backups = true
  apply_immediately    = true
# db_name              = Not applicable. Must be null.
# iam_database_authentication_enabled = Error creating DB Instance: InvalidParameterCombination: IAM Database Authentication is not supported for this configuration.
}
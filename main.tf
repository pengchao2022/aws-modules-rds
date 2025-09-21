# create random password for master 
resource "random_password" "master_password" {
  length           = 16
  special          = false
  override_special = "_%@"
}

# use AWS Secrets Manager to store password
resource "aws_secretsmanager_secret" "rds_credentials" {
  name = "rds-credentials-${var.db_name}"
}

resource "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id = aws_secretsmanager_secret.rds_credentials.id
  secret_string = jsonencode({
    username = var.username
    password = random_password.master_password.result
    engine   = var.engine
    dbname   = var.db_name
  })
}

module "rds" {
  source = "./modules/rds"

  # RDS basic configuration
  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type     = var.storage_type

  # database credentials
  db_name        = var.db_name
  username       = var.username
  password       = random_password.master_password.result

  # network configuration
  vpc_id         = var.vpc_id
  subnet_ids     = var.subnet_ids
  
  # replica sets configuration
  replica_count  = var.replica_count
  
  # others
  publicly_accessible = var.publicly_accessible
  skip_final_snapshot = var.skip_final_snapshot
  multi_az            = var.multi_az
}
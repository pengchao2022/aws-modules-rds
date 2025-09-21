resource "aws_security_group" "rds_sg" {
  name_prefix = "rds-sg-"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-security-group"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_db_instance" "master" {
  identifier = "${var.db_name}-master"

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type

  db_name  = var.db_name
  username = var.username
  password = var.password

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible = var.publicly_accessible
  skip_final_snapshot = var.skip_final_snapshot
  multi_az            = var.multi_az

  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "Mon:04:00-Mon:05:00"

  tags = {
    Name = "${var.db_name}-master"
  }
}

resource "aws_db_instance" "replica" {
  count = var.replica_count

  identifier = "${var.db_name}-replica-${count.index + 1}"

  replicate_source_db = aws_db_instance.master.identifier
  instance_class      = var.instance_class

  publicly_accessible = var.publicly_accessible
  skip_final_snapshot = var.skip_final_snapshot

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = "${var.db_name}-replica-${count.index + 1}"
  }
}
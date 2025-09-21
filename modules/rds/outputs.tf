output "rds_master_endpoint" {
  description = "master endpoint url"
  value       = aws_db_instance.master.endpoint
}

output "rds_replica_endpoints" {
  description = "replica set endpoint url"
  value       = aws_db_instance.replica[*].endpoint
}

output "rds_master_arn" {
  description = "master ARN"
  value       = aws_db_instance.master.arn
}

output "rds_security_group_id" {
  description = "RDS sg ID"
  value       = aws_security_group.rds_sg.id
}
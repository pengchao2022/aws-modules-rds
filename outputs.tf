output "rds_master_endpoint" {
  description = "master endpoints"
  value       = module.rds.rds_master_endpoint
}

output "rds_replica_endpoints" {
  description = "replica sets endpoints"
  value       = module.rds.rds_replica_endpoints
}

output "rds_master_arn" {
  description = "master ARN"
  value       = module.rds.rds_master_arn
}

output "rds_security_group_id" {
  description = "RDS sg ID"
  value       = module.rds.rds_security_group_id
}

output "secret_arn" {
  description = "Secrets Manager stored credentials ARN"
  value       = aws_secretsmanager_secret.rds_credentials.arn
}

output "secret_name" {
  description = "Secrets Manager stored credentials name"
  value       = aws_secretsmanager_secret.rds_credentials.name
}
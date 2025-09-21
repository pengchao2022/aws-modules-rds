variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "engine" {
  description = "engine for database"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "version of engine"
  type        = string
  default     = "8.0.28"
}

variable "instance_class" {
  description = "RDS instance type"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "dispatch storages (GB)"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "storage type"
  type        = string
  default     = "gp2"
}

variable "db_name" {
  description = "name of database"
  type        = string
  default     = "mydatabase"
}

variable "username" {
  description = "master username"
  type        = string
  default     = "admin"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "subnets ids list"
  type        = list(string)
}

variable "replica_count" {
  description = "number of replica sets"
  type        = number
  default     = 1
}

variable "publicly_accessible" {
  description = "allowed public access or not"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "do you want to skip snapshots"
  type        = bool
  default     = true
}

variable "multi_az" {
  description = "do you want multi-zas ?"
  type        = bool
  default     = false
}
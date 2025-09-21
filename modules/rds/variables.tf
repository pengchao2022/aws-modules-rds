variable "engine" {
  description = "数据库引擎"
  type        = string
}

variable "engine_version" {
  description = "数据库引擎版本"
  type        = string
}

variable "instance_class" {
  description = "RDS 实例类型"
  type        = string
}

variable "allocated_storage" {
  description = "分配的存储空间 (GB)"
  type        = number
}

variable "storage_type" {
  description = "存储类型"
  type        = string
}

variable "db_name" {
  description = "数据库名称"
  type        = string
}

variable "username" {
  description = "主用户名"
  type        = string
}

variable "password" {
  description = "主密码"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "subnets list ids"
  type        = list(string)
}

variable "replica_count" {
  description = "number of replica sets"
  type        = number
  default     = 0
}

variable "publicly_accessible" {
  description = "public access allowed or not"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Do you want to skip snapshots?"
  type        = bool
  default     = true
}

variable "multi_az" {
  description = "Do you want multi azs ?"
  type        = bool
  default     = false
}
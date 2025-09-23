# AWS RDS Modules

This tutorial terraform will create an RDS cluster with one mysql8 master and one replica set, the password will be stored in AWS secret manager .

## Features

- one RDS mysql8 master
- one RDS mysql8 replica
- random password stored in aws secrets manager

## Usage

- edit the terraform.tfvars file and provide your own aws information:
```hcl
region            = "us-east-1"
engine            = "mysql"
engine_version    = "8.0.42"
instance_class    = "db.t3.micro"
allocated_storage = 20
storage_type      = "gp2"
db_name           = "pengchaodata"
username          = "allen"

vpc_id     = "vpc-0a4d0ce9036000d08"
subnet_ids = ["subnet-021cbefd6098d88a6", "subnet-0d80b343edec42632", "subnet-098e2e95103a31267"]

replica_count       = 1
publicly_accessible = false
skip_final_snapshot = true
multi_az            = false

```




# Notice

- use the aws cli to get the password after you have the IAM role granted

```shell
 aws secretsmanager get-secret-value --secret-id rds-credentials-pengchaodata --query SecretString --output text
{"dbname":"pengchaodata","engine":"mysql","password":"Qfgfz2WXNnO4bxu6","username":"allen"}

```
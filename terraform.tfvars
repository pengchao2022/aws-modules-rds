region = "us-east-1"
engine = "mysql"
engine_version = "8.0.28"
instance_class = "db.t3.micro"
allocated_storage = 20
storage_type = "gp2"
db_name = "pengchaodata"
username = "allen"

vpc_id = "vpc-0a4d0ce9036000d08"
subnet_ids = ["subnet-021cbefd6098d88a6", "subnet-0d80b343edec42632", "subnet-098e2e95103a31267"]

replica_count = 1
publicly_accessible = false
skip_final_snapshot = true
multi_az = false
# aws-modules-rds
DevOps Tutorials

# use aws cli to get the password info:


pengchaoma@Pengchaos-MacBook-Pro aws-vpc-for-eks % aws secretsmanager get-secret-value --secret-id rds-credentials-pengchaodata --query SecretString --output text
{"dbname":"pengchaodata","engine":"mysql","password":"Qfgfz2WXNnO4bxu6","username":"allen"}
pengchaoma@Pengchaos-MacBook-Pro aws-vpc-for-eks % 
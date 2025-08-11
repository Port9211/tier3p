variable "aws_region" { default = "us-east-1" }
variable "cluster_name" { default = "my-eks-cluster" }
variable "vpc_id" { default = "vpc-xxxxxxxx" }
variable "private_subnet_ids" { default = ["subnet-aaaa1111", "subnet-bbbb2222"] }
variable "public_subnet_ids" { default = ["subnet-cccc3333", "subnet-dddd4444"] }
variable "owner" { default = "dev-team" }

variable "aws_region" { default = "us-east-1" }
variable "cluster_name" { default = "my-eks-cluster" }
variable "vpc_id" { default = "vpc-0b00f794cf6685220" }
variable "private_subnet_ids" { default = ["subnet-0c3638ffbab667700", "subnet-064f6dbf0da7ecdd0"] }
variable "public_subnet_ids" { default = ["subnet-0fda09de7e33150de", "subnet-04b7952074ad43e4b"] }
variable "owner" { default = "dev-team" }

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = ">= 18.0.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"
  vpc_id          = var.vpc_id
  subnets         = var.private_subnet_ids

  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.medium"]
    }
  }

  tags = {
    Owner = var.owner
  }
}

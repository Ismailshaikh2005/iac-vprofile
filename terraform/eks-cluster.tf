module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.19.1"

  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  # Turn off permissions you don't have
  create_iam_role             = false
  create_cloudwatch_log_group = false
  cluster_encryption_config   = {}

  # Skip IAM-related parts
  iam_role_name   = null
  iam_role_arn    = null
  iam_role_policy = {}
  cluster_enabled_log_types = []
  cluster_log_retention_in_days = null

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {}
}

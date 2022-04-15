# iam role
module "iam_eks_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-eks-role"
  version = "~> 4"

  role_name = "my-app"

  tags = {
    Name = "eks-role"
  }

  role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
  ]
}

module "iam_user_one" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 4"

  name          = "vasya.one"
  force_destroy = true

  pgp_key = "keybase:test"

  password_reset_required = false
}

module "iam_user_two" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 4"

  name          = "vasya.two"
  force_destroy = true

  pgp_key = "keybase:test"

  password_reset_required = false
}

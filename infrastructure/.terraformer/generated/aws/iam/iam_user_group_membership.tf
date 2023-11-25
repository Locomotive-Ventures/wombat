resource "aws_iam_user_group_membership" "tfer--liz_b_iam-002F-administrators_iam" {
  groups = ["administrators_iam"]
  user   = "liz_b_iam"
}

resource "aws_iam_user_group_membership" "tfer--olga_s-002F-administrators_iam" {
  groups = ["administrators_iam"]
  user   = "olga_s"
}

resource "aws_iam_user_group_membership" "tfer--wombat-terraform-002F-administrators_iam" {
  groups = ["administrators_iam"]
  user   = "wombat-terraform"
}

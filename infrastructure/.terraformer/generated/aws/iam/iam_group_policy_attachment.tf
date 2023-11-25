resource "aws_iam_group_policy_attachment" "tfer--administrators_iam_AdministratorAccess" {
  group      = "administrators_iam"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

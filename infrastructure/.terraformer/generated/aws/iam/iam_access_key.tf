resource "aws_iam_access_key" "tfer--AKIA2CTWMHVM72NXFREW" {
  depends_on = ["aws_iam_user.tfer--AIDA2CTWMHVM3K4WCZA2F"]
  status     = "Active"
  user       = "wombat-terraform"
}

resource "aws_iam_access_key" "tfer--AKIA2CTWMHVMZZGISF74" {
  depends_on = ["aws_iam_user.tfer--AIDA2CTWMHVMX72GJWSC3"]
  status     = "Active"
  user       = "liz_b_iam"
}

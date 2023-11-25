resource "aws_iam_user" "tfer--AIDA2CTWMHVM36N535SAF" {
  force_destroy = "false"
  name          = "olga_s"
  path          = "/"
}

resource "aws_iam_user" "tfer--AIDA2CTWMHVM3K4WCZA2F" {
  force_destroy = "false"
  name          = "wombat-terraform"
  path          = "/"

  tags = {
    AKIA2CTWMHVM72NXFREW = "github"
  }

  tags_all = {
    AKIA2CTWMHVM72NXFREW = "github"
  }
}

resource "aws_iam_user" "tfer--AIDA2CTWMHVMX72GJWSC3" {
  force_destroy = "false"
  name          = "liz_b_iam"
  path          = "/"

  tags = {
    AKIA2CTWMHVMZZGISF74 = "liz_b_iam_keys"
  }

  tags_all = {
    AKIA2CTWMHVMZZGISF74 = "liz_b_iam_keys"
  }
}

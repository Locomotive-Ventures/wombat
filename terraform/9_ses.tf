resource "aws_ses_domain_identity" "my_domain_identity" {
  domain = "example.com"
}

resource "aws_ses_domain_identity_verification" "my_verification" {
  domain = aws_ses_domain_identity.my_domain_identity.domain
}

resource "aws_ses_email_identity" "my_email_identity" {
  email = "info@example.com"
}

resource "aws_ses_domain_dkim" "my_dkim" {
  domain = aws_ses_domain_identity.my_domain_identity.domain
}

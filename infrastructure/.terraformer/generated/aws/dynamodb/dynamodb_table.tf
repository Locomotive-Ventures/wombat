resource "aws_dynamodb_table" "tfer--contact-table" {
  attribute {
    name = "campaignId"
    type = "S"
  }

  attribute {
    name = "uniqueId"
    type = "S"
  }

  billing_mode = "PROVISIONED"

  global_secondary_index {
    hash_key        = "campaignId"
    name            = "CampaignIndex"
    projection_type = "ALL"
    read_capacity   = "1"
    write_capacity  = "1"
  }

  hash_key = "uniqueId"
  name     = "contact-table"

  point_in_time_recovery {
    enabled = "false"
  }

  read_capacity  = "1"
  stream_enabled = "false"
  write_capacity = "1"
}

resource "aws_dynamodb_table" "tfer--wombat-tf-statelock" {
  attribute {
    name = "LockID"
    type = "S"
  }

  billing_mode = "PROVISIONED"
  hash_key     = "LockID"
  name         = "wombat-tf-statelock"

  point_in_time_recovery {
    enabled = "false"
  }

  read_capacity  = "1"
  stream_enabled = "false"
  table_class    = "STANDARD"
  write_capacity = "1"
}

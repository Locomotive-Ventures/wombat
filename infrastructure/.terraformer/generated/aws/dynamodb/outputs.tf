output "aws_dynamodb_table_tfer--contact-table_id" {
  value = "${aws_dynamodb_table.tfer--contact-table.id}"
}

output "aws_dynamodb_table_tfer--wombat-tf-statelock_id" {
  value = "${aws_dynamodb_table.tfer--wombat-tf-statelock.id}"
}

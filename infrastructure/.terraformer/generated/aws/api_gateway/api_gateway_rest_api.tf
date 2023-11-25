resource "aws_api_gateway_rest_api" "tfer--1wjy10yh87_ContactAPI" {
  api_key_source               = "HEADER"
  disable_execute_api_endpoint = "false"

  endpoint_configuration {
    types = ["EDGE"]
  }

  minimum_compression_size = "-1"
  name                     = "ContactAPI"
}

resource "aws_api_gateway_rest_api" "tfer--vn7d0has62_DynamoDBAPI" {
  api_key_source               = "HEADER"
  disable_execute_api_endpoint = "false"

  endpoint_configuration {
    types = ["EDGE"]
  }

  minimum_compression_size = "-1"
  name                     = "DynamoDBAPI"
}

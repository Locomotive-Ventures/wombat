resource "aws_api_gateway_integration_response" "tfer--1wjy10yh87-002F-gi4afw-002F-OPTIONS-002F-200" {
  http_method = "OPTIONS"
  resource_id = "gi4afw"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'"
    "method.response.header.Access-Control-Allow-Methods" = "'GET, POST, OPTIONS'"
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }

  rest_api_id = "1wjy10yh87"
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "tfer--1wjy10yh87-002F-gi4afw-002F-POST-002F-200" {
  http_method = "POST"
  resource_id = "gi4afw"

  response_templates = {
    "application/json" = "{\"statusCode\": 200}"
  }

  rest_api_id = "1wjy10yh87"
  status_code = "200"
}

resource "aws_api_gateway_method_response" "tfer--1wjy10yh87-002F-gi4afw-002F-OPTIONS-002F-200" {
  http_method = "OPTIONS"
  resource_id = "gi4afw"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "true"
    "method.response.header.Access-Control-Allow-Methods" = "true"
    "method.response.header.Access-Control-Allow-Origin"  = "true"
  }

  rest_api_id = "1wjy10yh87"
  status_code = "200"
}

resource "aws_api_gateway_method_response" "tfer--1wjy10yh87-002F-gi4afw-002F-POST-002F-200" {
  http_method = "POST"
  resource_id = "gi4afw"

  response_models = {
    "application/json" = "Empty"
  }

  rest_api_id = "1wjy10yh87"
  status_code = "200"
}

resource "aws_api_gateway_method_response" "tfer--vn7d0has62-002F-akky27-002F-GET-002F-200" {
  http_method = "GET"
  resource_id = "akky27"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Credentials" = "true"
    "method.response.header.Access-Control-Allow-Headers"     = "true"
    "method.response.header.Access-Control-Allow-Methods"     = "true"
    "method.response.header.Access-Control-Allow-Origin"      = "true"
  }

  rest_api_id = "vn7d0has62"
  status_code = "200"
}

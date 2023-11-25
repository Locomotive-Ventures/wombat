resource "aws_api_gateway_integration" "tfer--1wjy10yh87-002F-gi4afw-002F-OPTIONS" {
  cache_namespace      = "gi4afw"
  connection_type      = "INTERNET"
  http_method          = "OPTIONS"
  passthrough_behavior = "WHEN_NO_MATCH"

  request_templates = {
    "application/json" = "{\"statusCode\": 200}"
  }

  resource_id          = "gi4afw"
  rest_api_id          = "1wjy10yh87"
  timeout_milliseconds = "29000"
  type                 = "MOCK"
}

resource "aws_api_gateway_integration" "tfer--1wjy10yh87-002F-gi4afw-002F-POST" {
  cache_namespace         = "gi4afw"
  connection_type         = "INTERNET"
  credentials             = "arn:aws:iam::692811742553:role/wombat-ContactAPIRole-y8QH9O2s27l5"
  http_method             = "POST"
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_MATCH"

  request_parameters = {
    "integration.request.header.Content-Type" = "'application/x-www-form-urlencoded'"
  }

  request_templates = {
    "application/json" = "Action=SendMessage\u0026MessageBody=$util.urlEncode(\"$input.body\")\n"
  }

  resource_id          = "gi4afw"
  rest_api_id          = "1wjy10yh87"
  timeout_milliseconds = "29000"
  type                 = "AWS"
  uri                  = "arn:aws:apigateway:ap-southeast-2:sqs:path/692811742553/contact-queue"
}

resource "aws_api_gateway_integration" "tfer--vn7d0has62-002F-akky27-002F-GET" {
  cache_namespace         = "akky27"
  connection_type         = "INTERNET"
  credentials             = "arn:aws:iam::692811742553:role/wombat-DynamoDBAPIRole-oLIqFnr99yrP"
  http_method             = "GET"
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_MATCH"

  request_parameters = {
    "integration.request.header.Content-Type" = "'application/x-www-form-urlencoded'"
  }

  request_templates = {
    "application/json" = "Action=SendMessage\u0026MessageBody=$util.urlEncode(\"$input.body\")\n"
  }

  resource_id          = "akky27"
  rest_api_id          = "vn7d0has62"
  timeout_milliseconds = "29000"
  type                 = "AWS_PROXY"
  uri                  = "arn:aws:apigateway:ap-southeast-2:lambda:path/2015-03-31/functions/arn:aws:lambda:ap-southeast-2:692811742553:function:wombat-DynamoDBAPILambdaFunction-SZL0bE0WNpt6/invocations"
}

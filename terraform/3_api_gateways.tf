resource "aws_api_gateway_rest_api" "my_api" {
  name        = "MyAPI"
  description = "My API Description"
}

resource "aws_api_gateway_resource" "resource_post" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  parent_id   = aws_api_gateway_rest_api.my_api.root_resource_id
  path_part   = "post"
}

resource "aws_api_gateway_method" "method_post" {
  rest_api_id   = aws_api_gateway_rest_api.my_api.id
  resource_id   = aws_api_gateway_resource.resource_post.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_resource" "resource_get" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  parent_id   = aws_api_gateway_rest_api.my_api.root_resource_id
  path_part   = "get"
}

resource "aws_api_gateway_method" "method_get" {
  rest_api_id   = aws_api_gateway_rest_api.my_api.id
  resource_id   = aws_api_gateway_resource.resource_get.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_stage" "tfer--1wjy10yh87-002F-Prod" {
  cache_cluster_enabled = "false"
  deployment_id         = "6nqk3q"
  description           = "Production Stage"
  rest_api_id           = "1wjy10yh87"
  stage_name            = "Prod"
  xray_tracing_enabled  = "false"
}

resource "aws_api_gateway_stage" "tfer--vn7d0has62-002F-Prod" {
  cache_cluster_enabled = "false"
  deployment_id         = "zdmr9t"
  rest_api_id           = "vn7d0has62"
  stage_name            = "Prod"
  xray_tracing_enabled  = "false"
}

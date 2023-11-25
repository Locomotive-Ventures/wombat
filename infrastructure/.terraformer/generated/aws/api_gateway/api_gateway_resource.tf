resource "aws_api_gateway_resource" "tfer--460d4qndii" {
  parent_id   = ""
  path_part   = ""
  rest_api_id = "1wjy10yh87"
}

resource "aws_api_gateway_resource" "tfer--6bww5248pa" {
  parent_id   = ""
  path_part   = ""
  rest_api_id = "vn7d0has62"
}

resource "aws_api_gateway_resource" "tfer--akky27" {
  parent_id   = "6bww5248pa"
  path_part   = "data"
  rest_api_id = "vn7d0has62"
}

resource "aws_api_gateway_resource" "tfer--gi4afw" {
  parent_id   = "460d4qndii"
  path_part   = "message"
  rest_api_id = "1wjy10yh87"
}

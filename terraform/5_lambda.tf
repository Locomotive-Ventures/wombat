# resource "aws_lambda_function" "my_lambda" {
#   function_name = "MyLambdaFunction"
#   handler       = "index.handler"
#   runtime       = "nodejs14.x"
#   filename      = "path/to/your/lambda.zip"
#   role          = aws_iam_role.lambda_exec.arn
# }

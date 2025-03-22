# TODO: lambda, s3, knowledgebase, guardrail, prompt

resource "aws_s3_bucket" "flow_test" {
  bucket = "bedrockagent-flow-resource-flow-test"
}

resource "aws_lambda_function" "flow_test" {
  function_name = "flow-test"
  role          = aws_iam_role.flow_test_lambda_role.arn

  handler  = "main.handler"
  runtime  = "python3.9"
  filename = "lambda.zip"
}

resource "aws_iam_role" "flow_test_lambda_role" {
  name = "flow-test-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# resource "aws_bedrockagent_knowledge_base" "flow_test" {
#   name     = "flow-test"
#   role_arn = aws_iam_role.flow_test_kb_role.arn
# }

# resource "aws_iam_role" "flow_test_kb_role" {
#   name = "flow-test-kb-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Action = "sts:AssumeRole"
#       Effect = "Allow"
#       Principal = {
#         Service = "bedrock.amazonaws.com"
#       }
#     }]
#   })
# }

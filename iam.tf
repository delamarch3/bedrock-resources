resource "aws_iam_role" "bedrock_flows_exec_role" {
  name = "BedrockFlowsExecutionRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "bedrock.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "bedrock_flows_policy" {
  name        = "BedrockFlowsPolicy"
  description = "IAM policy for AWS Bedrock Flows execution role"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "bedrock:GetFlow"
          ],
          "Resource" : "*"
          # "Resource" : "${aws_bedrockagent_flow.test_flow_nodes.arn}"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "bedrock:InvokeModel"
          ],
          "Resource" : "arn:aws:bedrock:eu-west-2::foundation-model/meta.llama3-8b-instruct-v1:0"
        }
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "bedrock_flows" {
  role       = aws_iam_role.bedrock_flows_exec_role.name
  policy_arn = aws_iam_policy.bedrock_flows_policy.arn
}

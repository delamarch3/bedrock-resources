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

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "bedrock:GetFlow"
      ],
      "Resource": "${aws_bedrockagent_flow.test_flow_nodes.arn}"
    },
    {
      "Effect": "Allow",
      "Action": [
        "bedrock:InvokeModel"
      ],
      "Resource": "arn:aws:bedrock:eu-west-2::foundation-model/meta.llama3-8b-instruct-v1:0"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "bedrock_flows" {
  role       = aws_iam_role.bedrock_flows_exec_role.name
  policy_arn = aws_iam_policy.bedrock_flows_policy.arn
}

resource "aws_bedrockagent_flow" "test_simple" {
  name               = "TestSimple"
  execution_role_arn = aws_iam_role.bedrock_flows_exec_role.arn
  description        = "test description"
}

resource "aws_bedrockagent_flow" "test_flow_nodes" {
  name               = "TestFlowNodes"
  execution_role_arn = aws_iam_role.bedrock_flows_exec_role.arn
  description        = "test description"
  definition = {
    connections = [
      {
        type = "Data"
        configuration = {
          data = {
            source_output = "document"
            target_input  = "input"
          }
          conditional = null
        }
        name   = "FlowInputNodeFlowInputNode0ToTestPromptInlinePromptsNode0"
        source = "FlowInputNode"
        target = "TestPromptInline"
      },
      {
        type = "Data"
        configuration = {
          data = {
            source_output = "modelCompletion"
            target_input  = "document"
          }
          conditional = null
        }
        name   = "TestPromptInlinePromptsNode0ToFlowOutputNodeFlowOutputNode0"
        source = "TestPromptInline"
        target = "FlowOutputNode"
      },
    ]
    nodes = [
      {
        name = "FlowInputNode"
        type = "Input"
        configuration = {
          input           = {}
          agent           = null
          collector       = null
          condition       = null
          iterator        = null
          knowledge_base  = null
          lambda_function = null
          lex             = null
          output          = null
          prompt          = null
          retrieval       = null
          storage         = null
        }
        inputs = []
        outputs = [
          {
            name = "document"
            type = "String"
          },
        ]
      },
      {
        name = "TestPromptInline"
        type = "Prompt"
        configuration = {
          prompt = {
            source_configuration = {
              inline = {
                model_id      = "meta.llama3-8b-instruct-v1:0"
                template_type = "TEXT"
                template_configuration = {
                  text = {
                    input_variables = [
                      {
                        name = "input"
                      },
                    ]
                    text        = "{{input}}"
                    cache_point = null
                  }
                  chat = null
                }
                additional_model_request_fields = null // TODO: unexpected new value null? jsonencode({ key = "value" })
                inference_configuration = {
                  text = {
                    max_tokens     = 1000
                    stop_sequences = []
                    temperature    = 0.2
                    top_p          = 0.8
                  }
                }
              }
              resource = null
            }
            guardrail_configuration = null
          }
          input           = null
          agent           = null
          collector       = null
          condition       = null
          iterator        = null
          knowledge_base  = null
          lambda_function = null
          lex             = null
          output          = null
          retrieval       = null
          storage         = null
        }
        inputs = [
          {
            expression = "$.data"
            name       = "input"
            type       = "String"
          }
        ]
        outputs = [
          {
            name = "modelCompletion"
            type = "String"
          },
        ]
      },
      {
        name = "FlowOutputNode"
        type = "Output"
        configuration = {
          output          = {}
          input           = null
          agent           = null
          collector       = null
          condition       = null
          iterator        = null
          knowledge_base  = null
          lambda_function = null
          lex             = null
          prompt          = null
          retrieval       = null
          storage         = null
        }
        inputs = [
          {
            expression = "$.data"
            name       = "document"
            type       = "String"
          },
        ]
        outputs = []
      },
    ]
  }
}

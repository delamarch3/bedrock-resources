resource "aws_bedrockagent_flow" "test_blocks" {
  name               = "TestBlocks"
  execution_role_arn = aws_iam_role.bedrock_flows_exec_role.arn
  description        = "test description"

  definition {
    connections {
      name   = "FlowInputNodeFlowInputNode0ToTestPromptInlinePromptsNode0"
      source = "FlowInputNode"
      target = "TestPromptInline"
      type   = "Data"

      configuration {
        data {
          source_output = "document"
          target_input  = "input"
        }

        # conditional {
        #   condition = ""
        # }
      }
    }

    connections {
      name   = "TestPromptInlinePromptsNode0ToFlowOutputNodeFlowOutputNode0"
      source = "TestPromptInline"
      target = "FlowOutputNode"
      type   = "Data"

      configuration {
        data {
          source_output = "modelCompletion"
          target_input  = "document"
        }
      }
    }

    nodes {
      name = "FlowInputNode"
      type = "Input"

      configuration {
        input {}
      }
    }

    nodes {
      name = "FlowOutputNode"
      type = "Output"

      configuration {
        output {}
      }
    }

    nodes {
      name = "LambdaFunctionTest"
      type = "LambdaFunction"

      configuration {
        lambda_function {
          lambda_arn = aws_lambda_function.flow_test.arn
        }
      }
    }

    nodes {
      name = "StorageTest"
      type = "Storage"

      configuration {
        storage {
          service_configuration {
            s3 {
              bucket_name = aws_s3_bucket.flow_test.bucket
            }
          }
        }
      }
    }

    nodes {
      name = "RetrievalTest"
      type = "Retrieval"

      configuration {
        retrieval {
          service_configuration {
            s3 {
              bucket_name = aws_s3_bucket.flow_test.bucket
            }
          }
        }
      }
    }
  }
}

# resource "aws_bedrockagent_flow" "test" {
#   name                        = "test"
#   execution_role_arn          = aws_iam_role.bedrock_flows_exec_role.arn
#   description                 = "test"
#   customer_encryption_key_arn = null
#   definition = {
#     "connections" : [
#       {
#         "name" : ""
#         "source" : ""
#         "target" : ""
#         "type" : "Conditional|Data"
#         "configuration" : {
#           # One of:
#           "conditional" : {
#             "condition" : ""
#           }
#           "data" : {
#             "source_output" : ""
#             "target_output" : ""
#           }
#         }
#       }
#     ]
#     "nodes" : [
#       {
#         "name" : ""
#         "inputs" : [
#           {
#             "expression" : "$data."
#             "name" : ""
#             "type" : "String|Number|Boolean|Object|Array"
#           }
#         ]
#         "outputs" : [
#           {
#             "name" : ""
#             "type" : "String|Number|Boolean|Object|Array"
#           }
#         ]
#         "type" : "agent|collector|condition|input|iterator|knowledgeBase|lambdaFunction|lex|output|prompt|retrieval|storage"
#         "configuration" : {
#           # One of:
#           "agent" : {
#             "agent_alias_arn" : ""
#           }
#           "collector" : {
#             # Empty
#           }
#           "condition" : {
#             "conditions" : [
#               {
#                 "name" : "",
#                 "expression" : ""
#               }
#             ]
#           }
#           "input" : {
#             # Empty
#           }
#           "iterator" : {
#             # Empty
#           }
#           "knowledge_base" : {
#             "knowledge_base_id" : ""
#             "guardrail_configuration" : {
#               "guardrail_identifier" : ""
#               "guardrail_version" : ""
#             }
#             "model_id" : ""
#           }
#           "lambda_function" : {
#             "lambda_arn" : ""
#           }
#           "lex" : {
#             "bot_alias_arn" : ""
#             "locale_id" : ""
#           }
#           "output" : {
#             # Empty
#           }
#           "prompt" : {
#             "source_configuration" : {
#               # One of:
#               "inline" : {
#                 "model_id" : ""
#                 "template_configuration" : {
#                   # One of:
#                   "chat" : {
#                     "messages" : [
#                       {
#                         "role" : ""
#                         "content" : [
#                           {
#                             # One of:
#                             "cache_point" : {
#                               "type" : "default"
#                             }
#                             "text" : {
#                               "value" : ""
#                             }
#                           }
#                         ]
#                       }
#                     ]
#                     "input_variables" : [
#                       {
#                         "name" : ""
#                       }
#                     ]
#                     "system" : [
#                       {
#                         # One of:
#                         "cache_point" : {
#                           "type" : "default"
#                         }
#                         "text" : {
#                           "value" : ""
#                         }
#                       }
#                     ]
#                     "tool_configuration" : {
#                       "tools" : [
#                         {
#                           # One of
#                           "cache_point" : {
#                             "type" : "default"
#                           }
#                           "tool_spec" : {
#                             "input_schema" : {
#                               # One of:
#                               "json" : "" // or {}, document.Interface
#                             }
#                             "name" : ""
#                             "description" : ""
#                           }
#                         }
#                       ]
#                       "tool_choice" : {
#                         # One of:
#                         "any" : {
#                           # Empty
#                         }
#                         "auto" : {
#                           # Empty
#                         }
#                         "tool" : {
#                           "name" : ""
#                         }
#                       }
#                     }
#                   }
#                   "text" : {
#                     "text" : ""
#                     "cache_point" : {
#                       "type" : "default"
#                     }
#                     "input_variables" : [
#                       {
#                         "name" : ""
#                       }
#                     ]
#                   }
#                 }
#                 "template_type" : "TEXT|CHAT"
#                 "additional_model_request_fields" : "" // or {}, document.Interface
#                 "inference_configuration" : {
#                   "max_length" : 0
#                   "stop_sequences" : [""]
#                   "temperature" : 0.0
#                   "top_k" : 0
#                   "top_p" : 0.0
#                 }
#               }
#               "resource" : {
#                 "resource_arn" : ""
#               }
#             }
#             "guardrail_configuration" : {
#               "guardrail_identifier" : ""
#               "guardrail_version" : ""
#             }
#           }
#           "retrieval" : {
#             "service_configuration" : {
#               # One of:
#               "s3" : {
#                 "bucket_name" : ""
#               }
#             }
#           }
#           "storage" : {
#             "service_configuration" : {
#               # One of:
#               "s3" : {
#                 "bucket_name" : ""
#               }
#             }
#           }
#         }
#       }
#     ]
#   }
# }


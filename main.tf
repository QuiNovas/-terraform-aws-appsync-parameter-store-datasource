module "parameter_store_resolver" {
  dead_letter_arn = var.dead_letter_arn
  handler         = "function.handler"
  kms_key_arn     = var.kms_key_arn
  l3_object_key   = "quinovas/appsync-parameter-store-resolver/appsync-parameter-store-resolver-0.0.2.zip"
  name            = "${var.name_prefix}appsync-parameter-store-resolver"

  policy_arns = [
    aws_iam_policy.parameter_store_resolver.arn,
  ]
  runtime = "python3.7"
  source  = "QuiNovas/lambdalambdalambda/aws"
  timeout = 300
  version = "3.0.1"
}

resource "aws_iam_policy" "parameter_store_resolver" {
  name   = "${var.name_prefix}appsync-parameter-store-resolver"
  policy = data.aws_iam_policy_document.parameter_store_resolver.json
}

module "appsync_lambda_datasource" {
  api_id                   = var.api_id
  invoke_lambda_policy_arn = module.parameter_store_resolver.invoke_policy_arn
  lambda_function_arn      = module.parameter_store_resolver.arn
  name                     = "${replace(var.name_prefix, "-", "_")}ParameterStoreResolver"
  source                   = "QuiNovas/appsync-lambda-datasource/aws"
  version                  = "3.0.0"
}


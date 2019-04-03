module "parameter_store_task" {
  dead_letter_arn = "${var.dead_letter_arn}"
  kms_key_arn     = "${var.kms_key_arn}"
  name_prefix     = "${var.name_prefix}"
  source          = "QuiNovas/parameter-store-task/aws"
  version         = "0.1.0"
}

module "appsync_lambda_datasource" {
  api_id                   = "${var.api_id}"
  invoke_lambda_policy_arn = "${module.parameter_store_task.invoke_policy_arn}"
  lambda_function_arn      = "${module.parameter_store_task.arn}"
  name                     = "${replace("${var.name_prefix}","-","_")}ParameterStore"
  source                   = "QuiNovas/appsync-lambda-datasource/aws"
  version                  = "1.0.1"
}

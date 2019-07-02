data "aws_iam_policy_document" "parameter_store_resolver" {
  statement {
    actions = [
      "ssm:PutParameter",
      "ssm:GetParameters",
      "ssm:GetParameter",
      "ssm:GetParametersByPath",
    ]

    resources = [
      "*",
    ]

    sid = "ReadAndWriteParameters"
  }
}


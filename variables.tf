variable "api_id" {
  description = "The API ID for the GraphQL API for the DataSource."
  type        = "string"
}

variable "dead_letter_arn" {
  description = "The arn for the SNS topic that handles dead letters"
  type        = "string"
}

variable "kms_key_arn" {
  description = "The arn of the KMS key used to encrypt the environment variables"
  type        = "string"
}

variable "name_prefix" {
  default     = ""
  description = "The prefix to place on all created resources"
  type        = "string"
}

variable "ssm_kms_key_arn" {
  default     = ""
  description = "The arn of the KMS key used to encryption and decryption of SecureString parameters, default the system uses the default key associated with your AWS account"
  type        = "string"
}

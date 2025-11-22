variable "queue_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket allowed to send messages"
  type        = string
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

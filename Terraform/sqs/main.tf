resource "aws_sqs_queue" "tfer--xthon-queue" {
  content_based_deduplication       = "false"
  delay_seconds                     = "0"
  fifo_queue                        = "false"
  kms_data_key_reuse_period_seconds = "300"
  max_message_size                  = "1048576"
  message_retention_seconds         = "345600"
  name                              = var.queue_name

  policy = <<POLICY
{
  "Id": "S3_Events_Policy",
  "Statement": [
    {
      "Action": "sqs:SendMessage",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "arn:aws:s3:::${var.s3_bucket_name}"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Resource": "arn:aws:sqs:${var.region}:${var.account_id}:${var.queue_name}",
      "Sid": "Allow-S3-To-Send-Message"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  receive_wait_time_seconds  = "0"
  sqs_managed_sse_enabled    = "true"
  visibility_timeout_seconds = "30"
}

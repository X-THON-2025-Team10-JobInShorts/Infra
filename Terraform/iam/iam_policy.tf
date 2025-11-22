resource "aws_iam_policy" "tfer--Kubernetes-bot" {
  name = "Kubernetes-bot"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sqs:ReceiveMessage",
        "sqs:DeleteMessage",
        "sqs:GetQueueAttributes"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:sqs:${var.region}:${var.account_id}:${var.sqs_queue_name}",
      "Sid": "SQSProcess"
    },
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${var.s3_bucket_name}",
      "Sid": "S3Download"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

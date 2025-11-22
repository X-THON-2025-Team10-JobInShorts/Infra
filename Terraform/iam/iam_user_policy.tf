resource "aws_iam_user_policy" "tfer--Kubernetes-bot_Kubernetes-bot" {
  name = "Kubernetes-bot"

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
      "Resource": "arn:aws:sqs:ap-northeast-2:405445550843:xthon-queue",
      "Sid": "SQSProcess"
    },
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::x-thon-video-bucket",
      "Sid": "S3Download"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = "Kubernetes-bot"
}

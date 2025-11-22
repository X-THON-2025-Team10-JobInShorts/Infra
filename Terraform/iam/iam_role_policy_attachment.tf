resource "aws_iam_role_policy_attachment" "tfer--EC2-Kubernetes_AmazonS3FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = "EC2-Kubernetes"
}

resource "aws_iam_role_policy_attachment" "tfer--EC2-Kubernetes_AmazonSQSFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
  role       = "EC2-Kubernetes"
}

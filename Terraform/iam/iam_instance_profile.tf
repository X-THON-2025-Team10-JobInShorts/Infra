resource "aws_iam_instance_profile" "tfer--EC2-Kubernetes" {
  name = "EC2-Kubernetes"
  path = "/"
  role = "EC2-Kubernetes"
}

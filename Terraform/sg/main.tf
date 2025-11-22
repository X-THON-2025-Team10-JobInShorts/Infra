resource "aws_security_group" "tfer--Kubernetes-sg_sg-067bf74f7fc603061" {
  description = "xthon Kubernetes Security Group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "API connection "
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "6443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "6443"
  }

  ingress {
    description = "Kubernetes connection"
    from_port   = "0"
    protocol    = "-1"
    self        = "true"
    to_port     = "0"
  }

  ingress {
    description = "Vercel connection"
    from_port   = "30080"
    protocol    = "tcp"
    self        = "false"
    to_port     = "30080"
  }

  name   = "Kubernetes-sg"
  vpc_id = var.vpc_id_1
}

resource "aws_security_group" "tfer--default_sg-0390471f6e0036f79" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  vpc_id = var.vpc_id_1
}

resource "aws_security_group" "tfer--default_sg-06cc016c6b481d6fd" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  vpc_id = var.vpc_id_2
}

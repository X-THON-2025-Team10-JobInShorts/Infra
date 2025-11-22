resource "aws_instance" "tfer--i-06ee0f9759b2b6024_x-thon-Backend" {
  ami                         = var.ami_id
  associate_public_ip_address = "true"
  availability_zone           = var.availability_zone

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }



  cpu_options {
    core_count       = "1"
    threads_per_core = "2"
  }



  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  iam_instance_profile                 = "EC2-Kubernetes"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.medium"
  ipv6_address_count                   = "0"
  key_name                             = var.key_name

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = var.backend_private_ip

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    volume_size           = "8"
    volume_type           = "gp2"
  }

  source_dest_check = "true"
  subnet_id         = var.subnet_id

  tags = {
    Name = "x-thon-Backend"
  }

  tags_all = {
    Name = "x-thon-Backend"
  }

  tenancy                = "default"
  vpc_security_group_ids = var.security_group_ids
}

resource "aws_instance" "tfer--i-0fb03355133781c78_x-thon-AI" {
  ami                         = var.ami_id
  associate_public_ip_address = "true"
  availability_zone           = var.availability_zone

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }



  cpu_options {
    core_count       = "1"
    threads_per_core = "2"
  }



  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  iam_instance_profile                 = "EC2-Kubernetes"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.medium"
  ipv6_address_count                   = "0"
  key_name                             = var.key_name

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = var.ai_private_ip

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    volume_size           = "8"
    volume_type           = "gp2"
  }

  source_dest_check = "true"
  subnet_id         = var.subnet_id

  tags = {
    Name = "x-thon-AI"
  }

  tags_all = {
    Name = "x-thon-AI"
  }

  tenancy                = "default"
  vpc_security_group_ids = var.security_group_ids
}

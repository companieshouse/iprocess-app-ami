build {
  sources = [
    "source.amazon-ebs.builder",
  ]

  provisioner "ansible" {
    host_alias = "${var.ansible_host_alias}"
    playbook_file = "${var.playbook_file_path}"
    extra_arguments  = [
      "-e", "aws_region=${var.aws_region}",
      "-e", "aws_s3_release_bucket=${var.aws_s3_release_bucket}",
      "-e", "aws_s3_release_bucket_access_key=${var.aws_s3_release_bucket_access_key}",
      "-e", "aws_s3_release_bucket_secret_key=${var.aws_s3_release_bucket_secret_key}",            
      "-e", "nagios_api_key=${var.nagios_api_key}",
      "-e", "swap_volume_device_node=${var.swap_volume_device_node}",
      "-e", "swap_volume_enabled=${var.swap_volume_size_gb > 0 ? true : false}"
    ]
  }
}

variable "ami_account_ids" {
  type        = list(string)
  description = "A list of account IDs that have access to launch the resulting AMI(s)"
}

variable "ami_name_prefix" {
  type        = string
  default     = "iprocess-app"
  description = "The prefix string that will be used for the name tags of the resulting AMI and snapshot(s); the version string will be appended automatically"
}

variable "ansible_host_alias" {
  type        = string
  default     = "iprocess-app"
  description = "The Ansible host alias"
}

variable "aws_instance_type" {
  type        = string
  default     = "t2.medium"
  description = "The EC2 instance type used when building the AMI"
}

variable "aws_region" {
  type        = string
  default     = "eu-west-2"
  description = "The AWS region in which the AMI will be built"
}

variable "aws_source_ami_filter_name" {
  type        = string
  default     = "iprocess-base-ami"
  description = "The source AMI filter string. Any filter described by the DescribeImages API documentation is valid. If multiple images match then the latest will be used. This will be suffixed with a version number, or * if no version is provided"
}

variable "aws_source_ami_filter_version" {
  type        = string
  default     = "0.1.6"
  description = "The source AMI filter version. Used to enable control of version of source AMI from CI triggers."
}

variable "aws_source_ami_owner_id" {
  type        = string
  default     = "300288021642"
  description = "The source AMI owner ID; used in combination with aws_source_ami_filter_name to filter for matching source AMIs"
}

variable "aws_subnet_filter_name" {
  type        = string
  description = "The subnet filter string. Any filter described by the DescribeSubnets API documentation is valid. If multiple subnets match then the one with the most IPv4 addresses free will be used"
}

variable "playbook_file_path" {
  type        = string
  default     = "../ansible/playbook.yml"
  description = "The relative path to the Ansible playbook file"
}

variable "root_volume_size_gb" {
  type        = number
  default     = 40
  description = "The EC2 instance root volume size in Gibibytes (GiB)"
}

variable "ssh_private_key_file" {
  type        = string
  default     = "/home/packer/.ssh/packer-builder"
  description = "The path to the common Packer builder private SSH key"
}

variable "ssh_username" {
  type        = string
  default     = "ec2-user"
  description = "The username Packer will use when connecting with SSH"
}

variable "version" {
  type        = string
  description = "The semantic version number for the AMI; the version string will be appended automatically to the name tags added to the resulting AMI and snapshot(s)"
}

variable "encrypt_boot" {
  type        = bool
  default     = false
  description = "Whether to encrypt the root volume of the AMI (and instances created from it)"
}

variable "kms_key_id" {
  type        = string
  default     = null
  description = "KMS key ID, arn or alias to use for root volume encryption in the main region. If encrypt_boot is true and this is left null, the AWS default key is used"
}

variable "nagios_api_key" {
  type        = string
  default     = ""
  description = "This key will be supplied to the Nagios agent Ansible role to populate jinja templates"
}

variable "aws_s3_release_bucket" {
  type        = string
  description = "Bucket that contains any artifacts required to complete the build process, will be passed to Ansible"
}

variable "aws_s3_release_bucket_access_key" {
  type        = string
  description = "The AWS Access Key that allows access to the resource bucket"
  default     = ""
}

variable "aws_s3_release_bucket_secret_key" {
  type        = string
  description = "The AWS Secret Key that allows access to the resource bucket"
  default     = ""
}
variable "aws_profile" {
  type        = "string"
  description = "The aws profile for credentials saved in ~/.aws/credentials"
  default     = "sam_tf"
}

variable "aws_region" {
  type        = "string"
  description = "This is the region we use in AWS. Defaults to Ireland (eu-west-1)."
  default     = "ap-southeast-2"
}

variable "aws_ami_amazon_linux" {
  type        = "string"
  description = "the amazon AMI"
  default     = "ami-02fd0b06f06d93dfc"
}

variable "ec2_ssh_key_name" {
  type        = "string"
  description = "The name of the ssh key for ec2 instances."
  default     = "aws_development"
}

variable "aws_availability_zone" {
  type        = "string"
  description = "The availability zone we are using"
  default     = "ap-southeast-2c"
}

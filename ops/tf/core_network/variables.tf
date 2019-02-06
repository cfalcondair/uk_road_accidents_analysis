variable "aws_region" {
  type        = "string"
  description = "This is the region we use in AWS. Defaults to Ireland (eu-west-1)."
  default     = "ap-southeast-2"
}

variable "aws_profile" {
  type        = "string"
  description = "The aws profile for credentials saved in ~/.aws/credentials"
  default     = "sam_tf_super"
}

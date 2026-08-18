variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
  default     = "cicd-floci-bucket"
}

variable "project_name" {
  type        = string
  description = "Project name"
  default     = "TerraformCICD"
}
variable "region" {
  description = "AWS Region"
  type        = string
}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "stage" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "shutdown_delay_minutes" {
  description = "Minutes after which the EC2 instance shuts down automatically"
  type        = number
  default     = 15
}

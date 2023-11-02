variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message = "The user_uuid value is not a valid UUID."
  }
}

variable "bucket_name" {
  type        = string
  description = "Name of the AWS S3 bucket"

  validation {
    condition = can(regex("^([a-z0-9.-]{3,63})$", var.bucket_name))
    error_message = "The bucket name should be between 3 and 63 characters long and contain only lowercase letters, numbers, periods, and dashes. It should not start or end with a period or dash."
  }
}

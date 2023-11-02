output "bucket_name" {
  description = "Bucket name for our static website for hosting"
  value = module.terrahouse_aws.bucket_name
}
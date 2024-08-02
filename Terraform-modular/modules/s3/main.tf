resource "aws_s3_bucket" "state_tf" {
    bucket = var.bucket_name

    lifecycle {
      ignore_changes = all
    }
  
}


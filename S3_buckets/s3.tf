resource "aws_s3_bucket" "project-david-bucket-dev" {
  bucket = "project-david-bucket-dev"

  tags = {
    Name        = "project-david-bucket-dev"
    Environment = "Dev"
  }
  versioning {
    enabled = true
  }

}

resource "aws_dynamodb_table" "terraform-state-lock" {
  name         = "terraform-state-lock"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"


  attribute {
    name = "LockID"
    type = "S"
  }
}


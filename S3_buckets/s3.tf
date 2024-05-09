resource "aws_s3_bucket" "terraform-infra-practice-davidvacca" {
  bucket = "terraform-infra-practice-davidvacca"

  tags = {
    Name        = "Terraform-infra-practice-davidvacca"
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


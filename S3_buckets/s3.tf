resource "aws_s3_bucket" "Terraform-infra-practice-2024" {
  bucket = "Terraform-infra-practice-2024"

  tags = {
    Name        = "Terraform-infra-practice"
    Environment = "Dev"
  }
  versioning {
    enabled = true
  }

}

resource "aws_dynamodb_table" "terraform-state-lock" {
  name         = "terraform-state-lock"
  hash_key     = "LockID"
  billing_mode = "PAY-PER-REQUEST"


  attribute {
    name = "LockID"
    type = "S"
  }
}


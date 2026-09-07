resource "aws_s3_bucket" "example" {
  bucket = "my-tf-state-bucket-20260831-05"

  tags = {
    Name        = "My bucket-tf-state"
    Environment = "Dev"
  }
}
resource "aws_dynamodb_table" "remote-dynamodb-table" {
  name           = "my-infra-state-table"
  //billing_mode   = "PROVISIONED"     -> this is the default value, and its cost effective.
  billing_mode   = "PAY_PER_REQUEST"   
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }
}
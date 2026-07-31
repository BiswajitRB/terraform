resource "aws_s3_bucket" "my_bucket" {
  bucket = "raj-devops-386403274105-20260729"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

terraform {
  backend "s3" {
    bucket         = "final-project-terraform-remote-state-s3"
    key            = "terraform/final-project"
    region         = "us-east-1"
    encrypt        = "true"
    dynamodb_table = "final-project-terraform-remote-state-dynamodb"
  }
}

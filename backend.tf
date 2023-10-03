terraform {
  backend "s3" {
    bucket = "jhonata-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    # dynamodb_table = "your-dynamodb-table-name"  # Uncomment if using DynamoDB
  }
}
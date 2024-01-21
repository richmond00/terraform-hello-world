terraform {
  backend "s3" {
    key    = "terraform/tfstate.tfstate"
    bucket = "dw-remote-backend-2024"
    region = "us-east-2"
  }
}

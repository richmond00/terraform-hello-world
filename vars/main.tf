provider "aws" {
  region = "us-east-2"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "ec2" {
  ami           = "ami-0cd3c7f72edd5b06d"
  instance_type = "t2.micro"
  count         = var.number_of_servers
}

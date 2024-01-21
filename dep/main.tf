provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "db" {
  ami           = "ami-04f767d954fe2d2d1"
  instance_type = "t2.micro"
}

resource "aws_instance" "web" {
  ami           = "ami-04f767d954fe2d2d1"
  instance_type = "t2.micro"
  depends_on    = [aws_instance.db]
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0cd3c7f72edd5b06d"
  instance_type = "t2.micro"
  tags = {
    Name = "Web Server"
  }
  depends_on = [aws_instance.myec2db]
}

resource "aws_instance" "myec2db" {
  ami           = "ami-0cd3c7f72edd5b06d"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }
}

data "aws_instance" "dbsearch" {
  filter {
    name   = "tag:Name"
    values = ["DB Server"]
  }
}
data "aws_instance" "webserver" {
  filter {
    name   = "tag:Name"
    values = ["Web Server"]
  }
}

output "dbserver" {
  value = data.aws_instance.dbsearch.availability_zone
}
output "webserver" {
  value = data.aws_instance.webserver.arn
}

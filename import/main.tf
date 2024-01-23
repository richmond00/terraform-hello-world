provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "myvpc2" {
  cidr_block = "192.168.0.0/24"
}
// terraform import aws_vpc.myvpc2 vpcid from aws console
// myvpc2 will be under control of terraform

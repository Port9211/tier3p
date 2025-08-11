data "aws_vpc" "selected" {
  tags = {
    Name = "my-vpc"
  }
}

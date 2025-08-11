resource "aws_ecr_repository" "frontend" {
  name                 = "react-frontend"
  image_tag_mutability = "MUTABLE"
  tags = { Environment = "dev" }
}

resource "aws_ecr_repository" "backend" {
  name                 = "node-backend"
  image_tag_mutability = "MUTABLE"
  tags = { Environment = "dev" }
}

resource "aws_iam_user" "ci_user" {
  name = "ci-user"
}

resource "aws_iam_access_key" "ci_user_key" {
  user = aws_iam_user.ci_user.name
}

resource "aws_iam_policy" "ecr_push_policy" {
  name = "ecr-push-policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:PutImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload"
      ],
      Effect   = "Allow",
      Resource = "*"
    }]
  })
}

resource "aws_iam_user_policy_attachment" "ci_attach" {
  user       = aws_iam_user.ci_user.name
  policy_arn = aws_iam_policy.ecr_push_policy.arn
}

# Use terraform to query latest generated AMI..

# Builds an AWS IAM role
resource "aws_iam_role" "access_role" {
  name = "ec2_access_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

# Creates EC2 Instance Profile
resource "aws_iam_instance_profile" "access_profile" {
  name = "ec2_access_profile"
  role = aws_iam_role.access_role.name
}

# Adding an IAM policy
resource "aws_iam_role_policy" "access_policy" {
  name = "ec2_access_policy"
  role = aws_iam_role.access_role.id

  policy = <<EOF
{ 
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
 }
EOF
}
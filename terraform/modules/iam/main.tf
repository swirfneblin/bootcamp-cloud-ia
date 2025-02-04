resource "aws_iam_role" "ec2_admin" {
  name = "EC2Admin"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "admin_access" {
  name       = "admin_access_attachment"
  roles      = [aws_iam_role.ec2_admin.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

output "role_arn" {
  value = aws_iam_role.ec2_admin.arn
}

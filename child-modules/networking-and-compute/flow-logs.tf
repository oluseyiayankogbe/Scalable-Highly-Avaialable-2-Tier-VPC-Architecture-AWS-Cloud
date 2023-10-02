

resource "aws_flow_log" "fl-vpc-1" {
  iam_role_arn    = aws_iam_role.fl-vpc-iam-role.arn
  log_destination = aws_cloudwatch_log_group.drt-clg.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id
}

resource "aws_flow_log" "fl-vpc-2" {
  iam_role_arn    = aws_iam_role.fl-vpc-iam-role.arn
  log_destination = aws_cloudwatch_log_group.drt-clg.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc2.id
}


resource "aws_cloudwatch_log_group" "drt-clg" {
  name = "${var.project_name}-drt-clg"
}

resource "aws_iam_role" "fl-vpc-iam-role" {
  name = "${var.project_name}-fl-vpc-iam-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "fl-vpc-iam-role-policy" {
  name = "${var.project_name}-fl-vpc-iam-role-policy"
  role = aws_iam_role.fl-vpc-iam-role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
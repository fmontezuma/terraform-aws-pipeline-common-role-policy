resource "aws_iam_role" "codepipeline_role" {
  name = "${var.project}-codepipeline-pipeline"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "${var.project}-codepipeline-policy"
  role = "${aws_iam_role.codepipeline_role.id}"
  policy = "${file("${path.module}/pipeline-policy.json")}"
}

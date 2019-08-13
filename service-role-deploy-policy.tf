resource "aws_iam_role" "codebuild-deploy" {
  name = "${var.project}-codebuild-deploy"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "codebuild-deploy" {
  name = "${var.project}-codebuild-deploy"
  role = "${aws_iam_role.codebuild-deploy.name}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "logs:CreateLogStream",
                "sts:*",
                "s3:GetBucketAcl",
                "logs:PutLogEvents",
                "s3:GetBucketLocation",
                "s3:GetObjectVersion"
            ],
            "Resource": "*"
        },
        {
          "Effect":"Allow",
          "Action": [
            "s3:PutObject",
            "s3:GetObject",
            "s3:GetObjectVersion",
            "s3:GetBucketVersioning",
            "s3:GetBucketAcl",
            "s3:GetBucketLocation"
          ],
          "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "codecommit:*",
                "eks:ListUpdates",
                "sts:DecodeAuthorizationMessage",
                "eks:DescribeUpdate",
                "eks:DescribeCluster",
                "sts:GetCallerIdentity",
                "eks:ListClusters"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": [
                "ecr:ListTagsForResource",
                "ecr:UploadLayerPart",
                "ecr:BatchDeleteImage",
                "ecr:ListImages",
                "ecr:DeleteRepository",
                "ecr:CompleteLayerUpload",
                "ecr:TagResource",
                "ecr:DescribeRepositories",
                "ecr:DeleteRepositoryPolicy",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetLifecyclePolicy",
                "ecr:PutLifecyclePolicy",
                "ecr:GetLifecyclePolicyPreview",
                "ecr:CreateRepository",
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetAuthorizationToken",
                "ecr:DeleteLifecyclePolicy",
                "ecr:PutImage",
                "ecr:UntagResource",
                "ecr:SetRepositoryPolicy",
                "ecr:BatchGetImage",
                "ecr:DescribeImages",
                "ecr:StartLifecyclePolicyPreview",
                "ecr:InitiateLayerUpload",
                "ecr:GetRepositoryPolicy"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

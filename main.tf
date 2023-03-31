provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["C:/Users/QA-010518-004/.aws/config"]
  shared_credentials_files = ["C:/Users/QA-010518-004/.aws/credentials"]
  profile                  = "mgl-staging"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_policy" "ses_access" {
  name        = "ses_access_policy"
  path        = "/"
  description = "Policy to share access to lambda for ses"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ses:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy" "iam_access" {
  name        = "iam_access_policy"
  path        = "/"
  description = "Policy to share access to lambda for iam"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "iam:ListUsers",
          "iam:CreateAccessKey",
          "iam:DeleteAccessKey",
          "iam:GetAccessKeyLastUsed",
          "iam:GetUser",
          "iam:ListAccessKeys",
          "iam:UpdateAccessKey",
          "iam:ListUserTags"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "ses_access" {
  name       = "SES-access"
  roles      = [aws_iam_role.iam_for_lambda.name]
  policy_arn = aws_iam_policy.ses_access.arn
}

resource "aws_iam_policy_attachment" "logs_access" {
  name       = "lambda-execution-access"
  roles      = [aws_iam_role.iam_for_lambda.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_policy_attachment" "iam_access" {
  name       = "iam-access"
  roles      = [aws_iam_role.iam_for_lambda.name]
  policy_arn = aws_iam_policy.iam_access.arn
}


resource "aws_iam_role" "iam_for_lambda" {
  name               = "lambda-role-for-iam-rotations"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "app.py"
  output_path = "rotations.zip"
}

resource "aws_lambda_function" "alert_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "rotations.zip"
  function_name = "iam-rotations-lambda-alert"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "app.lambda_handler"
  timeout       = 300

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.8"
  lifecycle {
    # ignore_changes = [source_code_hash]
  }
  environment {
    variables = {
      sender_email = var.ses_email
      region       = var.ses_region
      days_70      = 70
      days_80      = 80
      days_90      = 90
      SUBJECT_70   = "AWS Access Key and Secret Key are going to expired in 20 days"
      BODY_TEXT_70 = "AWS Access Key and Secret Key are going to expired in 20 days"
      BODY_HTML_70 = var.email_html_70
      SUBJECT_80   = "AWS Access Key and Secret Key are going to expired in 10 days"
      BODY_TEXT_80 = "AWS Access Key and Secret Key are going to expired in 10 days"
      BODY_HTML_80 = var.email_html_80
      SUBJECT_90   = "AWS Access Key and Secret Key are going to expired today"
      BODY_TEXT_90 = "AWS Access Key and Secret Key are going to expired today"
      BODY_HTML_90 = var.email_html_90
    }
  }
}

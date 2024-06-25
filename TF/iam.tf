## Common ##
data "aws_iam_policy_document" "ecs_task_execution_role_assume_policy" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type = "Service"
      identifiers = [
        "ecs-tasks.amazonaws.com"
      ]
    }
  }
}


## ECS Task Execution Role ## 
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.name}-ecsTaskExecutionRole"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]
  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution_role_assume_policy.json
}


resource "aws_iam_role_policy" "ecs_task_execution_policy" {
  name = "${var.name}-ecs-task-execution"
  role = aws_iam_role.ecs_task_execution_role.id

  policy = data.aws_iam_policy_document.ecs_task_execution_policy_document.json
}

data "aws_iam_policy_document" "ecs_task_execution_policy_document" {

  statement {
    sid = "Logs"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "*"
    ]
  }
  statement {
    sid = "EcrContents"

    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage"
    ]

    resources = [
      "*"
    ]
  }

}

## ECS Task Role ##
resource "aws_iam_role" "ecs_task_role" {
  name = "${var.name}-ecsTaskRole"

  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution_role_assume_policy.json
}


resource "aws_iam_role_policy" "ecs_task_policy" {
  name = "${var.name}-ecs-task"
  role = aws_iam_role.ecs_task_role.id

  policy = data.aws_iam_policy_document.ecs_task_policy_document.json
}

data "aws_iam_policy_document" "ecs_task_policy_document" {

  statement {
    sid = "Logs"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid = "ECSPermissions"

    actions = [
      "ecs:ExecuteCommand",
      "ecs:DescribeTasks"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid = "AWSCLIECSExec"

    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel"
    ]

    resources = [
      "*"
    ]
  }
}

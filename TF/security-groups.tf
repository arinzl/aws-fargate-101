resource "aws_security_group" "ecs_task" {
  description = "Managed by Terraform"
  name        = "${var.name}-sg-task"
  vpc_id      = module.demo_ecs_vpc.vpc_id

  ingress {
    description = "Allow from private subnets"
    protocol    = "tcp"
    from_port   = var.container_port
    to_port     = var.container_port
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow to all internal destinations"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

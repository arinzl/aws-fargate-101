resource "aws_ecr_repository" "demo" {
  name = "${var.name}-demo"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

  rule {
    scan_frequency = "CONTINUOUS_SCAN"
    repository_filter {
      filter      = "*"
      filter_type = "WILDCARD"
    }
  }
}

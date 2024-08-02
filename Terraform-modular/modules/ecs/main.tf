resource "aws_ecs_cluster" "noumancluster" {
    name = var.cluster_name

}

resource "aws_ecs_service" "django_app_service" {
    name = var.service_name
    cluster = aws_ecs_cluster.noumancluster.id
    task_definition = var.task_definition_arn
    desired_count = var.desired_count
    launch_type = "FARGATE"

    network_configuration {
      subnets = var.subnets
      assign_public_ip = true
      security_groups = var.security_groups
    }
}
resource "aws_ecr_repository" "nouman" {
    name = var.ecr_name
    image_tag_mutability = "MUTABLE"

}
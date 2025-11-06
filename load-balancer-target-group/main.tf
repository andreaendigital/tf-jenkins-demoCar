# Input variables
variable "lb_target_group_name" {}
variable "lb_target_group_port" {}
variable "lb_target_group_protocol" {}
variable "vpc_id" {}
variable "ec2_instance_id" {}

# Output: ARN del target group
output "demoCar_1_lb_target_group_arn" {
  value = aws_lb_target_group.demoCar_1_lb_target_group.arn
}

# Resource: Load Balancer Target Group
resource "aws_lb_target_group" "demoCar_1_lb_target_group" {
  name     = var.lb_target_group_name
  port     = var.lb_target_group_port
  protocol = var.lb_target_group_protocol
  vpc_id   = var.vpc_id

    health_check {
    path                = "/login"
    port                = 8080
    healthy_threshold   = 6
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
    matcher             = "200" # has to be HTTP 200 or fails
  }

  tags = {
    Name        = var.lb_target_group_name
    Project     = "demoCar_1"
    CreatedBy   = "Terraform"
    Purpose     = "Jenkins CI/CD"
    CostCenter  = "FreeTier"
  }


}

# Resource: Attach EC2 to Target Group
resource "aws_lb_target_group_attachment" "demoCar_1_lb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.demoCar_1_lb_target_group.arn
  target_id        = var.ec2_instance_id
  port             = 8080
}

# This module creates a Target Group and attaches an EC2 instance to it.
# Health check is configured on port 8080 and path /login.
# Ensure the EC2 instance and listener are configured to respond on this path and port.
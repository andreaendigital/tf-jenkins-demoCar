# Input Variables
variable "lb_name" {}
variable "lb_type" {}
variable "is_external" { default = false }
variable "sg_enable_ssh_https" {}
variable "subnet_ids" {}
variable "tag_name" {}
variable "lb_target_group_arn" {}
variable "ec2_instance_id" {}
variable "lb_listner_port" {}
variable "lb_listner_protocol" {}
variable "lb_listner_default_action" {}
#variable "lb_https_listner_port" {}
#variable "lb_https_listner_protocol" {}
#variable "demoCar_1_acm_arn" {}
variable "lb_target_group_attachment_port" {}

#Output: DNS name of the load Balancer
output "aws_lb_dns_name" {
  value = aws_lb.demoCar_1_lb.dns_name
}

#Output:Zone ID of the Load Balancer
output "aws_lb_zone_id" {
  value = aws_lb.demoCar_1_lb.zone_id
}

#Resource: Application Load Balancer
resource "aws_lb" "demoCar_1_lb" {
  name               = var.lb_name
  internal           = var.is_external
  load_balancer_type = var.lb_type
  security_groups    = [var.sg_enable_ssh_https]
  subnets            = var.subnet_ids # Replace with subnet IDs

  enable_deletion_protection = false

  tags = {
    Name        = var.tag_name
    Project     = "demoCar_1"
    CreatedBy   = "Terraform"
    Purpose     = "Jenkins CI/CD"
    CostCenter  = "FreeTier"
  }

}

# Resource: Attach EC2 instance to target group
resource "aws_lb_target_group_attachment" "demoCar1_lb_target_group_attachment" {
  target_group_arn = var.lb_target_group_arn
  target_id        = var.ec2_instance_id 
  port             = var.lb_target_group_attachment_port
}

# Resource: HTTP listener
resource "aws_lb_listener" "demoCar_1_lb_listener" {
  load_balancer_arn = aws_lb.demoCar_1_lb.arn
  port              = var.lb_listner_port
  protocol          = var.lb_listner_protocol

  default_action {
    type             = var.lb_listner_default_action
    target_group_arn = var.lb_target_group_arn
  }
}

/*
# Uncomment this block if you add ACM certificate for HTTPS

# https listner on port 443
resource "aws_lb_listener" "demoCar_1_lb_https_listner" {
  load_balancer_arn = aws_lb.demoCar_1_lb.arn
  port              = var.lb_https_listner_port
  protocol          = var.lb_https_listner_protocol
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
  certificate_arn   = var.demoCar_1_acm_arn

  default_action {
    type             = var.lb_listner_default_action
    target_group_arn = var.lb_target_group_arn
  }
}
*/

# HTTPS listener block is disabled for demoCar_1 (no Route 53 or ACM certificate used).
# Uncomment and configure if HTTPS is required in future iterations.
# Outputs for demoCar_1 infrastructure
# These values help verify the deployment and connect to key resources like EC2 and ALB
# Useful for debugging, monitoring, and CI/CD integration


# Output: Public IP of Jenkins EC2 instance
output "jenkins_ec2_public_ip" {
  description = "Public IP address of the Jenkins EC2 instance"
  value       = module.jenkins.demoCar_1_ec2_instance_public_ip
}

# Output: SSH connection string for Jenkins EC2
output "jenkins_ssh_command" {
  description = "SSH command to connect to Jenkins EC2 from Windows"
  value       = module.jenkins.ssh_connection_string_for_ec2
}

# Output: Load Balancer DNS name
output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.aws_lb_dns_name

}

# Output: Load Balancer Zone ID
output "alb_zone_id" {
  description = "Zone ID of the Application Load Balancer"
  value       = module.alb.aws_lb_zone_id
}

# Output: Target Group ARN
output "alb_target_group_arn" {
  description = "ARN of the Load Balancer Target Group"
  value       = module.lb_target_group.demoCar_1_lb_target_group_arn
}

# Output: Security Group IDs
output "sg_web_id" {
  description = "Security Group ID for SSH, HTTP, HTTPS"
  value       = module.security_group.sg_demoCar_1_web_id
}

output "sg_jenkins_id" {
  description = "Security Group ID for Jenkins port 8080"
  value       = module.security_group.sg_demoCar_1_jenkins_id
}
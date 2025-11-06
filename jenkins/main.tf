# Input variables for Jenkins EC2 instance
variable "ami_id" {}
variable "instance_type" {}
variable "tag_name" {}
variable "public_key" {}
variable "subnet_id" {}
variable "sg_for_jenkins" {}
variable "enable_public_ip_address" {}
variable "user_data_install_jenkins" {}

# Output: SSH connection string (customized for Windows user Andrea)
output "ssh_connection_string_for_ec2" {
  value = format(
    "ssh -i C:/Users/Andrea/.ssh/aws_ec2_terraform ec2-user@%s",
    aws_instance.jenkins_ec2_instance.public_ip
  )
}


# Output: EC2 instance ID
output "jenkins_ec2_instance_ip" {
  value = aws_instance.jenkins_ec2_instance.id
}

# Output: EC2 public IP
output "demoCar_1_ec2_instance_public_ip" {
  value = aws_instance.jenkins_ec2_instance.public_ip
}

# Resource: EC2 instance for Jenkins
resource "aws_instance" "jenkins_ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = "aws_ec2_terraform"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.sg_for_jenkins
  associate_public_ip_address = var.enable_public_ip_address
  user_data                   = var.user_data_install_jenkins

  tags = {
    Name        = var.tag_name
    Project     = "demoCar_1"
    CreatedBy   = "Terraform"
    Purpose     = "Jenkins CI/CD"
    CostCenter  = "FreeTier"
  }


  metadata_options {
    http_endpoint = "enabled"  # Enable the IMDSv2 endpoint
    http_tokens   = "required" # Require the use of IMDSv2 tokens
  }
}

resource "aws_key_pair" "jenkins_ec2_instance_public_key" {
  key_name   = "aws_ec2_terraform"
  public_key = var.public_key
}
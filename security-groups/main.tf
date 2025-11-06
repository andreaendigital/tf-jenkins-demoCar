# Input variables
variable "ec2_sg_name" {}
variable "vpc_id" {}
variable "ec2_jenkins_sg_name" {}

# Output: SG ID for SSH/HTTP/HTTPS
output "sg_demoCar_1_web_id" {
  value = aws_security_group.demoCar_1_sg_web.id
}

# Output: SG ID for Jenkins port 8080
output "sg_demoCar_1_jenkins_id" {
  value = aws_security_group.demoCar_1_sg_jenkins.id
}

# Security Group: Allow SSH (22), HTTP (80), HTTPS (443)
resource "aws_security_group" "demoCar_1_sg_web" {
  name        = var.ec2_sg_name
  description = "Allow SSH (22), HTTP (80), and HTTPS (443)"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.ec2_sg_name
    Project     = "demoCar_1"
    CreatedBy   = "Terraform"
    Purpose     = "Web access (SSH, HTTP, HTTPS)"
    CostCenter  = "FreeTier"
  }
}

# Security Group: Allow Jenkins (8080)
resource "aws_security_group" "demoCar_1_sg_jenkins" {
  name        = var.ec2_jenkins_sg_name
  description = "Allow access to Jenkins on port 8080"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow access to Jenkins UI"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.ec2_jenkins_sg_name
    Project     = "demoCar_1"
    CreatedBy   = "Terraform"
    Purpose     = "Jenkins UI access"
    CostCenter  = "FreeTier"
  }
}
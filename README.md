# Jenkins Infrastructure on AWS with Terraform

This repository provisions a Jenkins server on AWS using Terraform. It includes networking, security groups, key pair configuration, and an EC2 instance with Jenkins pre-installed.

---

## 🏗️ Architecture


- **VPC, Subnets, and Internet Gateway** are created if not provided.
- **Security Groups** allow access to port `22` (SSH) and `8080` (Jenkins).
- **EC2 Instance** runs Amazon Linux with Jenkins installed via `user_data`.
- **SSH Key Pair** is created for secure access.

[Internet] | [Load Balancer] (optional) | [Security Group: Jenkins] | [EC2 Instance: Jenkins Server] | [Key Pair: SSH Access]

---

## ⚡ Quick Start

1. Clone the repository:


   git clone https://github.com/...   #completar
   cd jenkins-infra

```bash
cd infra
terraform init
terraform plan
terraform apply
```

- Update terraform.tfvars with your settings (see below)


## Configuration

Update `terraform.tfvars` with your settings:
- `public_key`: Your SSH public key
- `ec2_ami_id`: AMI ID for Amazon Linux 2023


## Access the Application

After deployment get the public IP::

```bash
# Get connection details
terraform output alb_dns_name
terraform output ec2_public_ip

# Access via Load Balancer
http://<alb-dns-name>

# Direct EC2 access
http://<ec2-public-ip>:8080
```

Connect via SSH:
ssh -i ~/.ssh/your_key ec2-user@<jenkins_public_ip>

- Retrieve the initial admin password:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


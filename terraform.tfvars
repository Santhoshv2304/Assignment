# terraform.tfvars - Configuration Values

# Basic Configuration
aws_region   = "us-east-1"
project_name = "automated-infra"
environment  = "dev"

# Network Configuration
vpc_cidr              = "10.0.0.0/16"
public_subnet_cidr    = "10.0.1.0/24"
private_subnet_cidr   = "10.0.2.0/24"

# EC2 Configuration
instance_type = "t3.medium"
# Generate your SSH key pair and add the public key here
# Example: ssh-keygen -t rsa -b 2048 -f ~/.ssh/aws-key
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC... your-public-key-here"

# Security Configuration
ssh_cidr = "0.0.0.0/0"  # Restrict this to your IP for better security
# Example: ssh_cidr = "123.456.789.0/32"

# Monitoring Configuration
alert_email                    = "your-email@example.com"
enable_monitoring             = true
cloudwatch_log_retention_days = 7
alarm_threshold_cpu           = 80
alarm_threshold_memory        = 80
alarm_threshold_disk          = 80

# CI/CD Configuration
jenkins_admin_password = "SecurePassword123!"  # Change this to a secure password
git_repository_url     = "https://github.com/your-username/your-web-app.git"
git_branch            = "main"

# Application Configuration
nginx_server_name      = "your-domain.com"  # Set your domain or use "_" for default
application_port       = 3000
deployment_environment = "staging"

# SSL Configuration (optional)
enable_ssl          = false
# ssl_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012"
# domain_name         = "your-domain.com"

# Auto Scaling Configuration (optional)
enable_auto_scaling           = false
min_capacity                 = 1
max_capacity                 = 3
desired_capacity             = 1
health_check_grace_period    = 300
health_check_type            = "ELB"

# Advanced Configuration
enable_detailed_monitoring      = true
enable_termination_protection   = false
ebs_optimized                  = true
enable_cloudwatch_agent        = true

# Backup Configuration
enable_backup      = true
backup_schedule    = "0 2 * * *"  # Daily at 2 AM
backup_retention_days = 7

# Jenkins Plugins (customize as needed)
jenkins_plugins = [
  "git",
  "workflow-aggregator", 
  "docker-workflow",
  "pipeline-stage-view",
  "build-timeout",
  "timestamper",
  "ws-cleanup",
  "ant",
  "gradle",
  "nodejs",
  "email-ext",
  "mailer",
  "github",
  "github-branch-source",
  "pipeline-github-lib",
  "ssh-slaves",
  "ssh-agent",
  "publish-over-ssh",
  "slack"
]

# Notification Configuration
notification_endpoints = [
  "your-email@example.com",
  # "slack-webhook-url",
  # "teams-webhook-url"
]

# Deployment Strategy
deployment_strategy = "rolling"

# Additional Tags
tags = {
  Owner       = "DevOps Team"
  Project     = "Automated Infrastructure"
  CostCenter  = "Engineering"
  Backup      = "Required"
  Monitoring  = "Enabled"
}

# Network Security (customize for production)
# For production, restrict SSH access to specific IP ranges
# ssh_cidr = "10.0.0.0/8,172.16.0.0/12,192.168.0.0/16"  # Private networks only

# Database Configuration (if needed for future expansion)
# db_instance_class    = "db.t3.micro"
# db_allocated_storage = 20
# db_engine_version    = "5.7"

# Load Balancer Configuration
# lb_idle_timeout              = 60
# lb_connection_draining       = true
# lb_connection_draining_timeout = 300

# CloudWatch Configuration
# custom_metrics_namespace = "CustomApp/Metrics"
# log_group_retention_days = 30

# Jenkins Configuration
# jenkins_heap_size     = "1g"
# jenkins_java_opts     = "-Djenkins.install.runSetupWizard=false"
# jenkins_admin_email   = "jenkins-admin@example.com"

# Application Specific Configuration
# app_min_heap_size = "512m"
# app_max_heap_size = "1g"
# app_environment_variables = {
#   NODE_ENV = "production"
#   PORT     = "3000"
#   LOG_LEVEL = "info"
# }
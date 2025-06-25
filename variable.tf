# variables.tf - Terraform Variables

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "automated-infra"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "public_key" {
  description = "Public key for EC2 key pair"
  type        = string
  default     = ""
}

variable "ssh_cidr" {
  description = "CIDR block for SSH access"
  type        = string
  default     = "0.0.0.0/0"
}

variable "alert_email" {
  description = "Email address for CloudWatch alerts"
  type        = string
  default     = "admin@example.com"
}

variable "jenkins_admin_password" {
  description = "Admin password for Jenkins"
  type        = string
  sensitive   = true
  default     = "admin123"
}

variable "git_repository_url" {
  description = "Git repository URL for CI/CD pipeline"
  type        = string
  default     = "https://github.com/your-username/your-repo.git"
}

variable "git_branch" {
  description = "Git branch to deploy"
  type        = string
  default     = "main"
}

variable "deployment_environment" {
  description = "Target deployment environment"
  type        = string
  default     = "staging"
}

variable "enable_monitoring" {
  description = "Enable CloudWatch monitoring"
  type        = bool
  default     = true
}

variable "cloudwatch_log_retention_days" {
  description = "CloudWatch log retention in days"
  type        = number
  default     = 7
}

variable "alarm_threshold_cpu" {
  description = "CPU utilization threshold for alarm"
  type        = number
  default     = 80
}

variable "alarm_threshold_memory" {
  description = "Memory utilization threshold for alarm"
  type        = number
  default     = 80
}

variable "alarm_threshold_disk" {
  description = "Disk utilization threshold for alarm"
  type        = number
  default     = 80
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "enable_ssl" {
  description = "Enable SSL/TLS for load balancer"
  type        = bool
  default     = false
}

variable "ssl_certificate_arn" {
  description = "ARN of SSL certificate for HTTPS"
  type        = string
  default     = ""
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
  default     = ""
}

variable "enable_auto_scaling" {
  description = "Enable auto scaling for EC2 instances"
  type        = bool
  default     = false
}

variable "min_capacity" {
  description = "Minimum number of instances"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Maximum number of instances"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired number of instances"
  type        = number
  default     = 1
}

variable "health_check_grace_period" {
  description = "Health check grace period in seconds"
  type        = number
  default     = 300
}

variable "health_check_type" {
  description = "Health check type (EC2 or ELB)"
  type        = string
  default     = "ELB"
}

variable "notification_endpoints" {
  description = "List of notification endpoints"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional tags for resources"
  type        = map(string)
  default     = {}
}

variable "enable_detailed_monitoring" {
  description = "Enable detailed monitoring for EC2 instances"
  type        = bool
  default     = true
}

variable "enable_termination_protection" {
  description = "Enable termination protection for EC2 instances"
  type        = bool
  default     = false
}

variable "ebs_optimized" {
  description = "Enable EBS optimization for EC2 instances"
  type        = bool
  default     = true
}

variable "enable_cloudwatch_agent" {
  description = "Enable CloudWatch agent for detailed metrics"
  type        = bool
  default     = true
}

variable "jenkins_plugins" {
  description = "List of Jenkins plugins to install"
  type        = list(string)
  default = [
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
    "slack",
    "github",
    "github-branch-source",
    "pipeline-github-lib",
    "ssh-slaves",
    "ssh-agent",
    "publish-over-ssh"
  ]
}

variable "nginx_server_name" {
  description = "Server name for Nginx configuration"
  type        = string
  default     = "_"
}

variable "application_port" {
  description = "Port on which the application runs"
  type        = number
  default     = 3000
}

variable "deployment_strategy" {
  description = "Deployment strategy (blue-green, rolling, etc.)"
  type        = string
  default     = "rolling"
}

variable "enable_backup" {
  description = "Enable automated backups"
  type        = bool
  default     = true
}

variable "backup_schedule" {
  description = "Backup schedule in cron format"
  type        = string
  default     = "0 2 * * *"
}
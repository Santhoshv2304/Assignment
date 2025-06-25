#!/bin/bash
# Start.sh - EC2 Instance Setup Script

set -e

# Update system
yum update -y

# Install required packages
yum install -y \
    git \
    curl \
    wget \
    unzip \
    java-11-amazon-corretto \
    docker \
    nginx \
    htop \
    vim \
    awscli \
    jq

# Start and enable Docker
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/v2.21.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install Node.js and npm
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

# Install Jenkins
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install -y jenkins

# Configure Jenkins
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

# Wait for Jenkins to start
sleep 30

# Set Jenkins admin password
JENKINS_PASSWORD="${jenkins_admin_password}"
echo "jenkins.model.Jenkins.instance.securityRealm.createAccount('admin', '$JENKINS_PASSWORD')" | java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ groovy =

# Install Jenkins plugins
JENKINS_PLUGINS=(
    "git"
    "workflow-aggregator"
    "docker-workflow" 
    "pipeline-stage-view"
    "build-timeout"
    "timestamper"
    "ws-cleanup"
    "ant"
    "gradle"
    "nodejs"
    "email-ext"
    "mailer"
    "github"
    "github-branch-source"
    "pipeline-github-lib"
    "ssh-slaves"
    "ssh-agent"
    "publish-over-ssh"
)

for plugin in "$${JENKINS_PLUGINS[@]}"; do
    java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ install-plugin "$plugin" -deploy
done

# Restart Jenkins to load plugins
systemctl restart jenkins
sleep 30

# Configure Nginx
cat > /etc/nginx/nginx.conf
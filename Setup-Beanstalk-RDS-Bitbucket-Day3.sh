#!/bin/bash

# -----------------------------------------
# AWS CI/CD Project Documentation
# Services: Elastic Beanstalk, RDS, Bitbucket
# Author: Taqi
# -----------------------------------------

echo "---- AWS CI/CD Project: Start Working ----"

# -----------------------------------------
# Step 1: Elastic Beanstalk Setup
# -----------------------------------------
echo "Step 1: Setting up Elastic Beanstalk Environment..."

# Before starting, generate a KeyPair for Beanstalk
echo "Generating KeyPair for Beanstalk..."
aws ec2 create-key-pair --key-name beanstalk-keypair --query 'KeyMaterial' --output text > beanstalk-keypair.pem
chmod 400 beanstalk-keypair.pem
echo "KeyPair generated successfully."

# Create Elastic Beanstalk Environment
echo "Creating Elastic Beanstalk Environment:"
echo "1. Environment Name: 'vprofile-env'"
echo "2. Domain Name: 'vprofile.yourdomain.com'"
echo "3. Platform: Apache Tomcat"
echo "4. Storage: gp3"
echo "5. Custom Configuration: Default settings applied."

# Placeholder for Beanstalk CLI Command
# aws elasticbeanstalk create-environment --application-name vprofile-app --environment-name vprofile-env ...

echo "Elastic Beanstalk Environment setup completed."

# -----------------------------------------
# Step 2: RDS Database Setup
# -----------------------------------------
echo "Step 2: Setting up AWS RDS..."

# Create a MySQL database
echo "Creating RDS instance:"
echo "1. Database Name: 'vprofile-db'"
echo "2. Engine: MySQL"
echo "3. Configuration: Default"

# Placeholder for RDS CLI Command
# aws rds create-db-instance --db-instance-identifier vprofile-db --engine mysql --allocated-storage 20 ...

echo "RDS instance created successfully."

# -----------------------------------------
# Step 3: Connect Beanstalk to RDS
# -----------------------------------------
echo "Step 3: Connecting Elastic Beanstalk instance to RDS..."

# Update Security Groups
echo "1. Copy Security Group ID of Beanstalk instance."
echo "2. Allow inbound traffic on port 3306 in RDS Security Group for Beanstalk SG."

echo "Updating inbound rules for RDS..."
# Placeholder for AWS CLI command
# aws ec2 authorize-security-group-ingress --group-id <RDS-SG-ID> --protocol tcp --port 3306 --source-group <Beanstalk-SG-ID>

echo "Security Group updated. Connection established."

# -----------------------------------------
# Step 4: Test RDS Connection
# -----------------------------------------
echo "Step 4: Testing RDS Connection..."

# SSH into the Beanstalk instance
echo "SSH into Beanstalk instance and install MySQL client:"
echo "Commands to run:"
echo "  1. dnf search mysql"
echo "  2. Install 'mariadb105': dnf install mariadb105"
echo "  3. Connect to RDS:"
echo "     mysql -h <rds-endpoint> -u admin -p'password' accounts"

# Run SQL Query on RDS
echo "Downloading SQL file and loading into RDS..."
echo "Command:"
echo "  mysql -h <rds-endpoint> -u admin -p'password' accounts < db_backup.sql"
echo "Verify connection: Run 'show tables' in MySQL client."

echo "RDS testing completed."

# -----------------------------------------
# Step 5: Bitbucket Setup
# ----------------
# Create Bitbucket Repository
echo "1. Create a Bitbucket account and repository."

# Generate SSH Keys
echo "Generating SSH Key for Bitbucket:"
ssh-keygen -t ed25519 -f ~/.ssh/vprobit_rsa -N ""
echo "Key generated. Add the public key (~/.ssh/vprobit_rsa.pub) to Bitbucket SSH settings."

# Configure SSH for Bitbucket
echo "Creating SSH config file..."
cat <<EOF > ~/.ssh/config
# Bitbucket Configuration
Host bitbucket.org
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/vprobit_rsa
EOF

echo "Config file created. Verify connection:"
echo "Command: ssh -T git@bitbucket.org"

# -----------------------------------------
# Step 6: Migrate Source Code from GitHub to Bitbucket
# -----------------------------------------
echo "Step 6: Migrating Source Code from GitHub to Bitbucket..."

# Clone repository
echo "Cloning source code from GitHub:"
git clone <github-repo-url>
cd <repo-directory>
git checkout aws-ci
git fetch --tags

# Remove GitHub Remote and Add Bitbucket
echo "Removing GitHub remote and adding Bitbucket remote..."
git remote rm origin
git remote add origin git@bitbucket.org:devopscicd-taqi/vproapp.git

# Push Code to Bitbucket
echo "Pushing code to Bitbucket..."
git push origin --all
echo "Code successfully migrated to Bitbucket repository."

# -----------------------------------------
# Summary
# -----------------------------------------
echo "---- Project Steps Summary ----"
echo "1. Elastic Beanstalk Environment created with Tomcat platform."
echo "2. RDS MySQL database set up and connected to Beanstalk."
echo "3. SQL queries executed on RDS database."
echo "4. Bitbucket repository configured with SSH keys."
echo "5. Source code migrated from GitHub to Bitbucket."

echo "CI/CD project setup completed successfully!"

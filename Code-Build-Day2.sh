#!/bin/bash

# AWS CodeBuild Documentation
# ---------------------------------------
# Purpose:
# AWS CodeBuild automates the build process and works similarly to Jenkins. 
# It follows a pay-as-you-go model, saving us from paying for running servers 
# unnecessarily. CodeBuild fetches the source code, executes the build steps, 
# and stores the artifacts in S3.

# ---------------------------------------
# Step 1: Create an S3 Bucket
# ---------------------------------------
# Purpose:
# S3 bucket is used to store the artifacts generated after the build process.

echo "Creating an S3 bucket for storing build artifacts..."
aws s3 mb s3://your-artifact-bucket-name
echo "S3 bucket created successfully."

# ---------------------------------------
# Step 2: Setting Up AWS CodeBuild
# ---------------------------------------
# Purpose:
# Set up AWS CodeBuild to automate build steps, connect with Bitbucket for 
# source code, and store artifacts in the S3 bucket.

echo "Starting AWS CodeBuild setup..."

# 1. Give a project name
echo "Step 2.1: Setting the project name: 'vprofile-codebuild'."

# 2. Select source: Bitbucket
echo "Step 2.2: Selecting Bitbucket as the source provider and connecting your repository."

# 3. Connect the S3 bucket (artifact storage)
echo "Step 2.3: Connecting the S3 bucket: 'your-artifact-bucket-name'."

# 4. Specify branch name
echo "Step 2.4: Specifying the branch name for the build process, e.g., 'master'."

# 5. Default settings
echo "Step 2.5: Keeping other build settings as default."

# 6. Build Specification
echo "Step 2.6: Adding or updating the 'buildspec.yml' file for build steps."
echo "The buildspec.yml file includes commands for:"
echo "  - Installing Maven."
echo "  - Connecting to RDS."
echo "  - Saving artifacts (e.g., .war or .jar files)."

echo "Reference the AWS CodeBuild documentation for detailed YAML configurations."

# 7. Artifact Section
echo "Step 2.7: Selecting the S3 bucket to store the generated build artifacts."

# 8. CloudWatch Logs
echo "Step 2.8: Configuring CloudWatch for streaming logs:"
echo "  - Group Name: 'codebuild-log-group'."
echo "  - Stream Name: 'codebuild-log-stream'."

echo "CloudWatch logs are important for monitoring and debugging the build process."

# ---------------------------------------
# Summary
# ---------------------------------------
echo "AWS CodeBuild setup is complete."
echo "Steps Completed:"
echo "1. Created S3 bucket for artifacts."
echo "2. Configured CodeBuild with Bitbucket as the source."
echo "3. Specified the branch name and YAML buildspec file."
echo "4. Enabled CloudWatch for log streaming."

echo "Use the following Git commands to trigger the build:"
echo "  git add ."
echo "  git commit -m 'CodeBuild Test Setup'"
echo "  git push"

echo "Your CI/CD pipeline is now ready with AWS CodeBuild!"


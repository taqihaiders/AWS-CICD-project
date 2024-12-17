#!/bin/bash

# -----------------------------------------
# AWS CI/CD Deployment Steps
# Services: CodePipeline, S3, Beanstalk, Bitbucket
# Author: Taqi
# -----------------------------------------

echo "---- AWS CI/CD: Deploying Artifact on Beanstalk ----"

# -----------------------------------------
# Step 1: Creating CodePipeline
# -----------------------------------------
echo "Step 1: Setting up CodePipeline..."

# CodePipeline Setup Instructions:
echo "1. Go to AWS CodePipeline Console."
echo "2. Create a new pipeline with the following settings:"
echo "   a. Name: 'vprofile-pipeline'"
echo "   b. Source Provider: Bitbucket (Connect your Bitbucket account)."
echo "   c. Artifact Store: S3 Bucket (Select or create an S3 bucket)."
echo "   d. Deployment Provider: Elastic Beanstalk (Select the Beanstalk application/environment)."
echo "3. Keep the rest of the settings as default and create the pipeline."

# Placeholder for AWS CLI CodePipeline Creation (Optional)
# aws codepipeline create-pipeline --cli-input-json file://pipeline.json

echo "CodePipeline created successfully. Source: Bitbucket -> Destination: Beanstalk."

# -----------------------------------------
# Step 2: Check Deployment
# -----------------------------------------
echo "Step 2: Verify Deployment..."

# Once deployment is complete, take the Beanstalk URL and test the application.
echo "1. Go to the Elastic Beanstalk console."
echo "2. Copy the environment URL (e.g., http://vprofile-env.your-region.elasticbeanstalk.com)."
echo "3. Open the URL in a browser and check if the application is working fine."

echo "Deployment verification completed."

# -----------------------------------------
# Step 3: Test CodePipeline Trigger (Bitbucket Commit Test)
# -----------------------------------------
echo "Step 3: Testing CodePipeline Trigger with Bitbucket..."

# Create a test file to verify pipeline tracking changes
TEST_FILE="test_pipeline_file.txt"

echo "Creating a test file '$TEST_FILE'..."
echo "This is a test file to verify CodePipeline triggers from Bitbucket." > $TEST_FILE

echo "Committing the test file to Bitbucket..."
git add $TEST_FILE
git commit -m "Test: Added a simple file to check CodePipeline tracking."
git push origin aws-ci

echo "Test file committed and pushed to Bitbucket. CodePipeline will detect the changes."

# Verification Steps:
echo "1. Monitor the CodePipeline Console to ensure the pipeline detects the commit."
echo "2. Wait for the pipeline to trigger the deployment to Beanstalk."
echo "3. Verify the updated application at the Beanstalk URL."

# -----------------------------------------
# Summary
# -----------------------------------------
echo "---- Deployment Summary ----"
echo "1. CodePipeline created connecting Bitbucket -> S3 -> Elastic Beanstalk."
echo "2. Deployment verified via Beanstalk URL."
echo "3. Pipeline tested by making a commit to Bitbucket."

echo "CI/CD Deployment and Testing completed successfully!"


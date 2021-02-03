# Solution

### Architecture Overview
![architecture diagram](/setup/Architecture_Diagram.png?raw=true)

### Pre-requisites
- AWS Account for deploying infrastructure
- AWS IAM User with the following attributes (created as part of cloudformation template)
  - **Permissions**: `AmazonEC2ContainerRegistryFullAccess` & `AmazonECS_FullAccess`
  - **Access**: Programmatic Only

### Services use to build Infrastructure
- **Amazon Virtual Private Cloud (VPC)** for hosting the application
- **Amazon Elastic Load Balancer (ELB)** - Application Load Balancer for routing traffic to application containers
- **AWS Fargate** - Serverless compute platform for hosting containers
- **Amazon Elastic Container Service (ECS)** as a container orchestrator as its free to use i.e. no changes for ECS cluster. Easy to use and offers good integration with AWS ecosystem.
- **Amazon Elastic Container Registry (ECR)** is a good private repository for storing container images, has features such as scan-on-push for finding vulnerabilities in the container image.
- **Amazon Relational Database Service (RDS)** for PosgreSQL is a managed database service which offloads a lot of heavy lifting in terms of ongoing maintenance.
- **AWS Systems Manager Parameter Store** for storing environment variables and sensitive data like database password.
- Infrastructure as Code (IaC) is via **CloudFormation** as it provides good integration with AWS platform and is something I'm familiar with.
- **GitHub Actions** for Continuous Integration (CI) & Continuous Delivery (CD)

### Get Started
- To get started, run the cloudformation template available in this repository at `/setup/awsInfra.yml` in a region of your choice.
- Create access key for IAM user (githubUser) and store it in a safe place.
- Save the credential file to a safe place
- Update the AWS credentials in github secrets so that GitHub actions deploys to an ECS cluster in your AWS account.
- Make a change to any file in the repository and commit to master, GitHub Actions will trigger and push changes to ECS.

### Application URL
Application can be accessed via this URL - http://mysta-publi-3ay3cma1rjbn-2062401908.us-west-2.elb.amazonaws.com/

Please let me know when I can tear down the environment. BTW, I changed the css settings to test changes.
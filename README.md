# Multi-AZ AWS Infrastructure with Terraform

A modular AWS infrastructure project provisioned using Terraform, demonstrating cloud networking, private compute, traffic management, IAM and secure instance administration.

## Architecture Overview

The infrastructure is deployed inside a custom Amazon VPC across two Availability Zones.

![AWS Multi-AZ Infrastructure Architecture](./architecture/AWS%20Terraform%20Infrastructure%20Architecture.png)

### Infrastructure Components

- **Amazon VPC:** Custom VPC with CIDR `10.0.0.0/16`.
- **Subnets:** Four subnets across two Availability Zones, separating public-facing and private resources.
- **Internet Gateway:** Provides internet connectivity to public subnets.
- **Route Tables:** Separate routing configurations for public and private subnets.
- **Application Load Balancer:** Internet-facing ALB distributing HTTP traffic to private EC2 instances.
- **Amazon EC2:** Two instances deployed in separate private subnets without public IP addresses.
- **Security Groups:** Restrict backend HTTP traffic to the ALB security group.
- **AWS IAM:** Instance role and profile for secure AWS service access.
- **AWS Systems Manager:** Enables instance management without requiring direct SSH access.
- **VPC Interface Endpoints:** Private connectivity for SSM, SSM Messages and EC2 Messages.

## Network Design

| Resource | CIDR |
|---|---|
| VPC | `10.0.0.0/16` |
| Public Subnet AZ-1 | `10.0.1.0/24` |
| Private Subnet AZ-1 | `10.0.2.0/24` |
| Public Subnet AZ-2 | `10.0.3.0/24` |
| Private Subnet AZ-2 | `10.0.4.0/24` |

## Terraform Module Structure

```text
terraform-aws-multi-az-infrastructure/
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── providers.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── .terraform.lock.hcl
├── modules/
│   ├── vpc/
│   ├── security-group/
│   ├── alb/
│   ├── ec2/
│   ├── iam/
│   └── vpc-endpoints/
├── architecture/
└── backend/
    └── bootstrap/
```

Each module encapsulates a specific infrastructure component, making the configuration modular and reusable.

## Technologies Used

- Amazon Web Services (AWS)
- Terraform
- HashiCorp Configuration Language (HCL)
- Amazon VPC
- Amazon EC2
- Application Load Balancer
- AWS IAM
- AWS Systems Manager

## Deployment

### Prerequisites

- AWS account
- AWS CLI configured with appropriate permissions
- Terraform installed

### Initialize Terraform

```bash
cd environments/dev
terraform init
```

### Review Infrastructure Plan

```bash
terraform plan
```

### Provision Infrastructure

```bash
terraform apply
```

### Destroy Infrastructure

```bash
terraform destroy
```

## Project Status

Infrastructure provisioning has been completed. Target health checks and end-to-end traffic validation are still pending.

## Learning Outcomes

- Designing multi-AZ AWS network architectures.
- Implementing public and private network segmentation.
- Provisioning AWS resources using modular Terraform configurations.
- Configuring IAM roles and security boundaries.
- Integrating Systems Manager with private VPC endpoints.
- Managing infrastructure lifecycle through Terraform.

---

**Author:** Aryan Arora

**Repository:** [terraform-aws-multi-az-infrastructure](https://github.com/aryan-aroraa/terraform-aws-multi-az-infrastructure)

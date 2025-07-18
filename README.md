
# 🌩️ Multi-Cloud Terraform Infrastructure as Code (IaC)

This repository contains modular, clean, and reusable Terraform configurations for deploying infrastructure on **DigitalOcean**, **Azure**, and **AWS**. Each cloud provider is organized in its own directory with further categorization of resources for clarity and scalability.

---

## 📁 Folder Structure

```
terraform-iac/
│
├── digitalocean/
│   ├── modules/
│   │   └── droplet/
│   │   └── vpc/
│   └── environments/
│       └── dev/
│       └── prod/
│
├── azure/
│   ├── modules/
│   │   └── vm/
│   │   └── vnet/
│   │   └── nsg/
│   │   └── storage_account/
│   └── environments/
│       └── dev/
│       └── prod/
│
├── aws/
│   ├── modules/
│   │   └── ec2/
│   │   └── vpc/
│   │   └── s3/
│   │   └── iam/
│   └── environments/
│       └── dev/
│       └── prod/
│
└── README.md
```

---

## 🌐 Cloud Providers Covered

- **DigitalOcean**: Droplets, VPC, Load Balancers, etc.
- **Azure**: Virtual Machines, VNet, NSG, Storage Accounts, etc.
- **AWS**: EC2, VPC, IAM, S3 Buckets, etc.

---

## ✅ Features

- Modular design for reusable components
- Environment-specific configurations (dev, prod)
- Clear input/output variable structure
- Follows Terraform best practices

---

## 🚀 Getting Started

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Plan the deployment
```bash
terraform plan 
```

### 3. Apply the configuration
```bash
terraform apply 
```

---

## 📌 Notes

- Store sensitive values in `terraform.tfvars` or use a secure secrets manager (e.g., Azure Key Vault, AWS Secrets Manager).
- Each environment folder has its own `main.tf`, `variables.tf`, and `outputs.tf`.
- Modules are versioned and can be reused across multiple environments.

---

## 📧 Contact

For questions or improvements, feel free to open an issue or pull request.
https://pk.linkedin.com/in/nexusameer

---

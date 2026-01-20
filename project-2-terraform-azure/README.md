# 🚀 Project 2 — Terraform Azure CI/CD Deployment

## 📌 Overview

This project demonstrates **Infrastructure as Code (IaC)** using **Terraform** to provision Azure infrastructure and deploy a **Dockerized FastAPI application** automatically via **GitHub Actions CI/CD pipeline**.

It is designed as a **real-world DevOps project** and forms part of a larger cloud portfolio and MSc final-year project combining:

- CI/CD automation
- Cloud infrastructure provisioning
- Containerized application deployment

---

## 🧠 What This Project Solves

Traditional cloud infrastructure setup and deployment is:
❌ Manual  
❌ Error-prone  
❌ Slow

This project provides:
✅ Fully automated infrastructure provisioning  
✅ Automated container deployment  
✅ Repeatable, scalable cloud environments

---

## 🛠️ Tech Stack

| Layer                  | Technology            |
| ---------------------- | --------------------- |
| Cloud                  | Microsoft Azure       |
| Infrastructure as Code | Terraform             |
| CI/CD                  | GitHub Actions        |
| Containerization       | Docker                |
| Backend                | FastAPI (Python)      |
| Web Server             | Nginx (Reverse Proxy) |
| OS                     | Ubuntu Linux          |

---

## 📁 Project Structure (Matches Your Repository)

```
project-2-terraform-azure/
│
├── .github/
│   └── workflows/
│       ├── terraform-azure-cli.yml    # Infrastructure provisioning      # GitHub Actions pipeline
│       └── deploy.yml                 # Application deployment
|
├── .terraform/                          # Terraform provider cache
|    ├── providers
│    └── terraform.tfstate               # LOCAL CACHE of remote state
|
├── app/                                 # FastAPI application source
│   ├── main.py
│   └── requirements.txt
│
├── .gitignore
├── .terraform.lock.hcl
├── cloud-init.sh                        # VM startup bootstrap script
├── Dockerfile.txt                       # Docker image build file
│
├── main.tf                              # Core Terraform resources
├── provider.tf                          # Azure provider config
├── variables.tf                         # Input variables
├── terraform.tfvars                     # Variable values
│
├── network.tf                           # Virtual network + subnet
├── network-interface.tf                # NIC configuration
├── nsg.tf                               # Network Security Group
├── nsg-association.tf                  # NSG attachment
├── vm.tf                                # Virtual Machine definition
├── outputs.tf                           # Terraform output values
│
└── README.md                            # Project documentation
```

---

## 🏗️ Architecture

```
GitHub Push
     |
     v
GitHub Actions CI/CD
     |
     v
Docker Image Build → Docker Hub
     |
     v
Terraform Apply
     |
     v
Azure VM Provisioned
     |
     v
FastAPI Container Deployed
     |
     v
Nginx Reverse Proxy → Public Access
```

---

## ⚙️ How the System Works

1️⃣ Developer pushes code to GitHub  
2️⃣ GitHub Actions builds Docker image  
3️⃣ Image is pushed to Docker Hub  
4️⃣ Terraform provisions Azure infrastructure  
5️⃣ VM pulls latest Docker image  
6️⃣ FastAPI app runs automatically  
7️⃣ Nginx exposes service to the internet

---

## 🚀 How to Run Locally (Optional)

```bash
cd app
docker build -t fastapi-app .
docker run -p 8000:8000 fastapi-app
```

Test:

```bash
curl http://localhost:8000
```

---

## ☁️ How to Deploy on Azure

### Prerequisites

- Azure account
- Terraform installed
- GitHub repository
- Docker Hub account

---

### Step 1 — Configure Terraform

Edit `terraform.tfvars`:

```hcl
location = "East US"
vm_size = "Standard_B1s"
admin_username = "azureuser"
```

---

### Step 2 — Initialize Terraform

```bash
terraform init
terraform plan
terraform apply
```

---

### Step 3 — Setup GitHub Secrets

Add in GitHub repo → **Settings → Secrets**:

| Secret Name           | Value                   |
| --------------------- | ----------------------- |
| AZURE_CLIENT_ID       | Azure service principal |
| AZURE_CLIENT_SECRET   | Azure secret            |
| AZURE_TENANT_ID       | Azure tenant            |
| AZURE_SUBSCRIPTION_ID | Azure subscription      |
| DOCKER_USERNAME       | DockerHub username      |
| DOCKER_PASSWORD       | DockerHub password      |
| SSH_PRIVATE_KEY       | VM SSH key              |
| VM_HOST               | VM public IP            |
| VM_USER               | azureuser               |

---

### Step 4 — Push Code

```bash
git push origin main
```

Deployment happens automatically 🚀

---

## ✅ Verification

```bash
curl http://<VM_PUBLIC_IP>
```

Expected output:

```json
{ "message": "Auto-deployed from GitHub Actions 🚀" }
```

---

## 📊 Evaluation Metrics

| Metric          | Manual Deployment | Automated Pipeline |
| --------------- | ----------------- | ------------------ |
| Setup Time      | High              | Low                |
| Errors          | Likely            | Minimal            |
| Reproducibility | Poor              | Excellent          |
| Scalability     | Hard              | Easy               |

---

## 🔒 Security Features

- SSH key-based VM access
- Azure NSG firewall rules
- Secrets stored securely in GitHub Actions
- No credentials in code

---

## 🔮 Future Enhancements

- HTTPS with Let's Encrypt
- Kubernetes migration
- Auto-scaling
- Prometheus monitoring
- Blue-green deployments

---

## 👨‍💻 Author

**Atefor Lesley Nkezi**  
MSc Computer Science | Cloud & DevOps Engineer  
GitHub: https://github.com/lesley237

---

## ⭐ If You Found This Useful

Give this repo a ⭐ and feel free to fork it 🚀

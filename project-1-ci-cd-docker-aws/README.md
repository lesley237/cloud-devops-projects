🚀 Project 1: CI/CD Pipeline with Docker & GitHub Actions (Auto-Deploy to Azure VM)
📌 Project Overview

This project demonstrates a complete CI/CD pipeline that automatically builds, pushes, and deploys a FastAPI application using Docker, GitHub Actions, Docker Hub, and an Azure Virtual Machine.

Every push to the main branch triggers a pipeline that:

Builds a Docker image

Pushes the image to Docker Hub

Connects securely to an Azure VM via SSH

Replaces the running container with the latest version (zero manual steps)

This project reflects a real-world, production-style DevOps workflow.

🏗️ Architecture
Developer → GitHub → GitHub Actions
                     |
                     | (Build & Push)
                     ↓
                Docker Hub
                     |
                     | (Pull & Deploy)
                     ↓
                Azure Virtual Machine
                     |
                     ↓
                FastAPI App (Port 80)

🛠️ Tech Stack

Backend: FastAPI (Python)

Containerization: Docker

CI/CD: GitHub Actions

Image Registry: Docker Hub

Cloud: Microsoft Azure (Ubuntu VM)

Automation: SSH-based remote deployment

📂 Project Structure
cloud-devops-projects
├── .github
│   └── workflows
│       └── deploy.yml       # CI/CD pipeline definition
├── project-1-ci-cd-docker-aws
│   ├── app/
│   │   └── main.py          # FastAPI application
│   ├── Dockerfile           # Docker build instructions
│   ├── docker-compose.yml   # Local container orchestration
│   └── README.md

🔁 CI/CD Workflow Explanation
🔹 Trigger

The pipeline runs automatically on every push to the main branch:

on:
  push:
    branches:
      - main

🔹 Pipeline Steps
1️⃣ Checkout Code
- uses: actions/checkout@v4

2️⃣ Login to Docker Hub

Uses encrypted GitHub Secrets:

DOCKERHUB_USERNAME

DOCKERHUB_TOKEN

- uses: docker/login-action@v3

3️⃣ Build & Push Docker Image
docker build -t lesley237/fastapi-app:latest .
docker push lesley237/fastapi-app:latest

4️⃣ Deploy to Azure VM via SSH

Actions performed on the VM:

Pull latest image

Stop & remove old container

Clean unused images

Run updated container on port 80

docker pull lesley237/fastapi-app:latest
docker rm -f fastapi-app || true
docker image prune -f
docker run -d --name fastapi-app -p 80:8000 lesley237/fastapi-app:latest

🔐 Secrets & Security

All sensitive information is stored securely using GitHub Secrets.

Secret Name	Description
DOCKERHUB_USERNAME	Docker Hub username
DOCKERHUB_TOKEN	Docker Hub access token
VM_HOST	Azure VM public IP
VM_USER	Azure VM username
VM_SSH_KEY	Private SSH key

✔ No secrets hardcoded
✔ SSH key-based authentication
✔ Production-safe deployment

🌐 Application Endpoints
Endpoint	Description
/	Application status
/health	Health check
Example
curl http://<AZURE_VM_PUBLIC_IP>


Response:

{
  "message": "Auto-deployed from GitHub Actions 🚀"
}

✅ Key DevOps Concepts Demonstrated

CI/CD automation

Docker image lifecycle management

GitHub Actions workflows

Secure secret handling

Remote VM deployments

Container replacement strategy

Cloud-native DevOps practices

🎯 Outcome

✔ Fully automated deployment
✔ Zero manual server intervention
✔ Cloud-hosted containerized application
✔ Production-ready CI/CD pipeline

🚀 What’s Next?

➡ Project 2: Infrastructure as Code (Terraform on Azure)

Planned components:

Virtual Networks (VNet)

Subnets & Network Security Groups (NSG)

Azure Virtual Machines

Automated provisioning using Terraform

👤 Author

Atefor Lesley Nkezi
MSc Computer Science
Aspiring Cloud & DevOps Engineer

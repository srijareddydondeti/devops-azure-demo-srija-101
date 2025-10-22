DevOps Project: CI/CD on Azure using Terraform, Docker & GitHub Actions
🚀 Project Overview

This project demonstrates an end-to-end DevOps workflow using open-source tools to build, containerize, and deploy a simple Python Flask web application on Microsoft Azure — completely automated with GitHub Actions CI/CD and Terraform (Infrastructure as Code).

The goal is to show how a DevOps engineer can automate application delivery to the cloud using modern, lightweight tools — all within a free Azure account and public open-source ecosystem.

🧠 Key Concepts Covered

✅ CI/CD pipeline (GitHub Actions)
✅ Containerization (Docker)
✅ Infrastructure as Code (Terraform)
✅ Cloud deployment (Azure Container Instances)
✅ Secrets management & automation
✅ (Optional) Observability using Prometheus & Grafana

Developer → GitHub Repo → GitHub Actions
       ↓ (Build + Test + Dockerize)
Docker Hub ← Push Container Image
       ↓ (Terraform Deploy)
Azure Resource Group → Azure Container Instance
       ↓
  Flask App (Public URL)


Step 1: Build a Simple Flask App

app/app.py
app/requirements.txt
app/Dockerfile



⚙️ Step 2: Containerize and Test Locally
cd app
docker build -t yourdockerhubusername/devops-azure-demo:local .
docker run -p 8080:8080 yourdockerhubusername/devops-azure-demo:local


Visit: http://localhost:8080

☁️ Step 3: Provision Azure Infrastructure (Terraform)

Terraform resources:

Azure Resource Group

Azure Container Instance

Public IP & DNS for container

Commands:

cd terraform
terraform init
terraform apply -auto-approve -var="image=yourdockerhubusername/devops-azure-demo:latest"


Terraform will output a public FQDN.
Visit http://<fqdn>:8080 to see your app running on Azure.

🔁 Step 4: Automate Everything with GitHub Actions

.github/workflows/ci-cd.yml

Builds & pushes Docker image to Docker Hub

Provisions Azure infrastructure using Terraform

Automatically updates image version on deployment

Secrets to configure in GitHub:

Secret Name	Description
DOCKERHUB_USERNAME	Your Docker Hub username
DOCKERHUB_TOKEN	Docker Hub access token
AZURE_CREDENTIALS	JSON output from Azure service principal

Once configured, every commit to main triggers:

✅ Build & test

✅ Push image

✅ Terraform apply → Deploy to Azure

# Terraform Kubernetes CI/CD Deployment

## Overview

This project demonstrates a complete cloud-native deployment workflow using Terraform, Docker, Kubernetes, Minikube, and CI/CD practices.

The project shows how a modern DevOps workflow moves an application from source code into a running Kubernetes environment.

Infrastructure is managed using Terraform as Infrastructure as Code (IaC). The application is containerized using Docker, deployed using Kubernetes, and exposed through a Kubernetes Service.

This project was developed and tested locally using Minikube to simulate a production-style Kubernetes environment.

---

## Architecture

Developer
|
v
Source Code
|
v
GitHub Repository
|
v
GitHub Actions CI/CD
|
v
Docker Image Build
|
v
Terraform
|
v
Kubernetes Cluster
|
v
Nginx Container
|
v
Application Running


---

## Project Objectives

This project demonstrates:

- Infrastructure as Code using Terraform
- Containerization using Docker
- Kubernetes application deployment
- CI/CD workflow concepts
- Automated infrastructure management
- Cloud-native application delivery


---

# Technologies Used

## Terraform

Terraform is used to manage Kubernetes infrastructure through code.

Terraform creates and manages:

- Kubernetes Namespace
- Kubernetes Deployment
- Kubernetes Service

Benefits:

- Repeatable deployments
- Version-controlled infrastructure
- Automated resource management


---

## Kubernetes

Kubernetes manages the application workload.

Features used:

- Pods
- Deployments
- Services
- Namespace isolation

Kubernetes ensures the application remains available and running.


---

## Docker

Docker packages the application into a container image.

The image contains:

- Nginx web server
- Application files
- Runtime configuration

The Docker image is deployed into Kubernetes.


---

## Minikube

Minikube provides a local Kubernetes cluster for development and testing.

It allows the complete DevOps workflow to be tested locally before cloud deployment.


---

## GitHub Actions

GitHub Actions provides CI/CD automation.

The workflow can automate:

1. Code changes
2. Docker image build
3. Application deployment
4. Kubernetes updates


---

# Project Structure

terraform-kubernetes-cicd/

├── app/

│   ├── Dockerfile

│   └── index.html


├── terraform/

│   ├── main.tf

│   ├── provider.tf

│   └── variables.tf


├── screenshots/

│   ├── 01-minikube-status-and-service-url.png

│   ├── 02-application-running-browser.png

│   └── 03-kubernetes-pods-running.png


├── README.md

└── .gitignore


---

# Deployment Process

## 1. Start Minikube

Command:

minikube start


Check status:

minikube status


Expected:

host: Running

kubelet: Running

apiserver: Running


---

## 2. Build Docker Image

Navigate to application folder:

cd app


Build image:

docker build -t terraform-k8s-app:v1 .


Check image:

docker images


Load image into Minikube:

minikube image load terraform-k8s-app:v1


---

## 3. Terraform Deployment

Navigate to Terraform:

cd terraform


Initialize Terraform:

terraform init


Review plan:

terraform plan


Deploy:

terraform apply


Terraform creates Kubernetes resources automatically.


---

# Kubernetes Resources Created

## Namespace

The application runs inside:

devops


This keeps resources isolated.


---

## Deployment

The Kubernetes Deployment manages application containers.

It provides:

- Running replicas
- Automatic restart
- Rolling updates


---

## Service

The application is exposed using NodePort.

Check service:

kubectl get svc -n devops


Access application:

minikube service nginx-service -n devops --url


---

# Verification

Check running pods:

kubectl get pods -n devops


Expected:

READY   STATUS

1/1     Running

1/1     Running

1/1     Running


This confirms successful Kubernetes deployment.


---

# Application Flow

Application Code

↓

Docker Container

↓

Kubernetes Pod

↓

Kubernetes Service

↓

Browser


---

# Screenshots

## Minikube Status and Service URL

![Minikube Status](screenshots/01-minikube-status-and-service-url.png.png)


## Application Running in Browser

![Application Running](screenshots/02-application-running-browser.png.png)


## Kubernetes Pods Running

![Kubernetes Pods](screenshots/03-kubernetes-pods-running.png.png)


---

# DevOps Concepts Demonstrated

This project demonstrates:

- Infrastructure as Code
- Docker containerization
- Kubernetes orchestration
- CI/CD workflow
- Deployment automation
- Cloud-native architecture


---

# Future Improvements

Future improvements:

- Complete GitHub Actions pipeline
- Push Docker images automatically
- Deploy to AWS EKS
- Add monitoring using Prometheus and Grafana
- Add Kubernetes secrets management
- Add Terraform remote backend


---

# Conclusion

This project demonstrates how Terraform, Docker, Kubernetes, and CI/CD practices work together to deliver a modern cloud-native application.

Terraform manages infrastructure, Docker packages the application, Kubernetes manages deployment, and automation practices provide a foundation for continuous delivery.

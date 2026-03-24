# Terraform-Docker Infrastructure Project

A comprehensive infrastructure-as-code project demonstrating Docker containerization, Kubernetes deployment, and Helm chart management using Terraform.

## 📁 Project Structure

```
Terraform-Docker/
├── main.tf                 # Root Docker container deployment
├── variables.tf            # Root variables
├── output.tf              # Root outputs
├── terraform.tfstate      # Terraform state (not committed)
├── terraform.tfstate.backup
├── .terraform/            # Terraform cache (not committed)
├── .terraform.lock.hcl    # Provider lock file
└── Terraform-docker-build/
    ├── main.tf            # Docker image build configuration
    ├── app/               # Sample application
    │   └── Dockerfile     # Docker build instructions
    ├── Terraform-k8s/     # Kubernetes deployment
    │   └── main.tf        # K8s resource definitions
    └── Terraform-Helm/    # Helm chart deployment
        └── main.tf        # Helm release configuration
```

## 🚀 Quick Start

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
- [Docker](https://www.docker.com/get-started) >= 20.0.0
- [Minikube](https://minikube.sigs.k8s.io/docs/start/) (for Kubernetes deployments)
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (for Kubernetes management)
- [Helm](https://helm.sh/docs/intro/install/) >= 3.0.0 (for Helm deployments)

### Deployment Steps

#### 1. Basic Docker Container (Root Level)

```bash
cd Terraform-Docker
terraform init
terraform plan
terraform apply
```

This deploys a basic nginx container using Docker provider.

#### 2. Custom Docker Image Build

```bash
cd Terraform-docker-build
terraform init
terraform plan
terraform apply
```

Builds a custom Docker image and deploys it.

#### 3. Kubernetes Deployment

```bash
cd Terraform-docker-build/Terraform-k8s
terraform init
terraform plan
terraform apply
```

Deploys the application to a Kubernetes cluster.

#### 4. Helm Chart Deployment

```bash
cd Terraform-docker-build/Terraform-k8s/Terraform-Helm
terraform init
terraform plan
terraform apply
```

Deploys nginx using Helm charts with custom configuration.

## 🔧 Configuration

### Providers Used

- **Docker Provider**: Container management
- **Kubernetes Provider**: K8s resource management
- **Helm Provider**: Helm chart deployment

### Key Features

- **Multi-level deployment**: From basic containers to full Helm releases
- **Infrastructure as Code**: Complete automation of deployment process
- **Scalable architecture**: Demonstrates different deployment patterns
- **Production ready**: Includes proper resource configuration and outputs

## 📊 Architecture Overview

1. **Level 1**: Basic Docker container with port mapping
2. **Level 2**: Custom Docker image build and deployment
3. **Level 3**: Kubernetes deployment with services and ingress
4. **Level 4**: Helm chart deployment with values customization

## 🛠️ Usage Examples

### Access Deployed Services

#### Docker Container
```bash
docker ps  # Check running containers
curl http://localhost:5050  # Access nginx
```

#### Kubernetes + Helm
```bash
minikube service nginx --url -n default
# Output: http://127.0.0.1:57358
```

### Common Commands

```bash
# Initialize Terraform
terraform init

# Plan deployment
terraform plan

# Apply changes
terraform apply

# Destroy infrastructure
terraform destroy

# Check Helm status
helm status nginx -n default

# View Kubernetes resources
kubectl get pods,svc -n default
```

## 🔒 Security Considerations

- State files (`terraform.tfstate`) are not committed to version control
- Sensitive variables should be managed through environment variables or secret management
- Use `.gitignore` to exclude sensitive files

## 📝 Variables

### Root Level Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `container_name` | Name of the Docker container | `nginx_container` |
| `internal_port` | Internal container port | `80` |
| `external_port` | External host port | `5050` |

### Helm Deployment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `nginx_replicas` | Number of nginx replicas | `2` |
| `service_type` | Kubernetes service type | `NodePort` |
| `node_port` | NodePort for external access | `30080` |

## 🐛 Troubleshooting

### Common Issues

1. **Port already in use**: Change `external_port` or `node_port` variables
2. **Minikube not running**: Start with `minikube start`
3. **Docker not accessible**: Ensure Docker Desktop is running
4. **Provider version conflicts**: Check `.terraform.lock.hcl`

### Debug Commands

```bash
# Check Terraform version
terraform version

# Validate configuration
terraform validate

# Show current state
terraform show

# Check providers
terraform providers

# View logs
kubectl logs -l app.kubernetes.io/name=nginx
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and validation
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support

For issues and questions:
- Check the troubleshooting section
- Review Terraform and provider documentation
- Open an issue in the repository

---

**Happy Deploying! 🚀**
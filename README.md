# Final Project EKS RDS Terraform

## Description
![Alt text](/final_project_diagram.png?raw=true "Final Project Diagram")

Terraform project to setup an AWS EKS cluster with its components including private subnets and a RDS PostgreSQL instance including its  private subnets, and also configuring the VPC with the customized networking proposed in the diagram attached for 2 availability zones within the us-east-1 region.

## Getting Started
This project follows the following file structure:
```
├── modules: folder of the modules configured for the project
│   ├── eks_cluster
│   │   ├─── eks_cluster.tf
│   │   ├─── outputs.tf
│   │   └─── variables.tf
│   ├── eks_worker_nodes
│   │   ├─── eks_worker_nodes.tf
│   │   ├─── outputs.tf
│   │   └─── variables.tf
│   ├── rds
│   │   ├─── outputs.tf
│   │   ├─── rds.tf
│   │   └─── variables.tf
│   └── vpc_networking
│       ├─── outputs.tf
│       ├─── private_subnet_eks.tf
│       ├─── private_subnet_rds.tf
│       ├─── public_subnet.tf
│       ├─── variables.tf
│       └─── vpc.tf
├── policies: all policies created for the project
│   ├── assume_eks_cluster_role_policy.json
│   └── assume_eks_worker_nodes_role_policy.json
├── backend.tf: s3 backend configured to store terraform state files and dynamodb configuration to lock
├── main.tf: main set of configuration for all the modules used
├── providers.tf: providers configured for the terraform project
├── variables.tf: variables defined that will be used inside terraform templates
├── final_project_diagram.png
└── README.md
```

## Usage
Run ```terraform init``` to initialize the working directory containing Terraform configuration files.

Run ```terraform apply``` to deploy the serverless application.


## Connect to the deployed EKS Cluster

Execute the following command by providing the cluster name chose, if used the default variables it will be eks_cluster like below

Run ```aws eks update-kubeconfig --name eks_cluster --region us-east-1``` to update your kubeconfig to be able to connect to the EKS cluster.


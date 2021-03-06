# Giving Anthos a spin using Terraform

<!-- PROJECT LOGO -->

<!-- ABOUT THE PROJECT -->
## About The Project
Get up and running with Anthos leveraging Terraform Modules.  All you need is a project (with a network).

Anthos Benefits:
* Kubernetes Everywhere (under your control)
* Container Management - GKE/k8s
* Config Management - ACM
* Service Management - ASM

Terraform Benefits:
* Repeatable Provisioning
* Declarative Configuration
* Single source of truth

A list of commonly used resources that I find helpful are listed in the Resources.

### Prerequisites

**Google Cloud Project**

You require the name of the project only.  Any required APIs will be enabled during your first Terraform run.

**VPC**

You will need to create a VPC network with a subnet and two secondary IP ranges based on how many clusters you would like to build (reading this now makes me realize I should include Terraform modules for this as well)

# What to do once you clone

```
File Descriptions
```
variables.tf  
terraform.tfvars  
main.tf  
apis.tf  
hub.tf  
clusters.tf  
asm.tf  
acm.tf  
```
What you need to supply (build this into a chart so you have a description field)
```
primary_region      = ""
primary_zones      = [""]
secondary_region      = ""
secondary_zones      = [""]
project_id          = ""
acm_repo_location   = ""
acm_branch          = ""
acm_dir             = ""

```
Walking through the deployment

```

### The Process

#### Initial Steps


Clone  
Fill out terraform.tfvars
You start with (variables.tf, terraform.tfvars, main.tf and apis.tf)  
terraform init  
Initializes your provider, downloads module and builds your state.  
terraform plan
terraform apply

Initializes the state and enables the required APIs.

#### Building your cluster(s)

Sets up your GKE cluster(s) in your project.  
clusters.tf

#### Registering your clusters to an Anthos environ

Cluster registration
hub.tf

#### Anthos Service Mesh (ASM)

Installs Anthos Service Mesh (ASM)  
asm.tf

#### Anthos Config Management (ACM)

Enables Anthos Config Management (ACM)  
acm.tf

#### Beyond the setup

Application Deployment  
Playing with Config Management  
Playing with Service Mesh

<!-- GETTING STARTED -->
## Getting Started



### Prerequisites



<!-- Repo Strcuture -->
## Repo Structure
```
single/         # Single Cluster Build         
dual/           # Dual Cluster Build                

```


<!-- Resource LINKS  -->
## Resources

[Anthos Service Mesh Documentation](https://cloud.google.com/service-mesh/docs)
[Terraform Kubernetes Engine ASM Submodule](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest/submodules/asm)

[Anthos Config Management Documentation](https://cloud.google.com/anthos-config-management/docs)
[Terraform Kubernetes Engine ACM Submodule](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest/submodules/acm)

Document any gotchas.  Review periodically and remove as they become resolved  
Go back and run from a vanilla machine to ensure nothing has been overlooked or assumed.

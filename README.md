# Giving Anthos a spin using Terraform

<!-- PROJECT LOGO -->

<!-- ABOUT THE PROJECT -->
## About The Project
Get up and running with Anthos leveraging Terraform Modules.  All you need is a project (with a network).

What you are creating:

Single - One GKE public cluster, Cluster Registration, ASM installation, ACM installation

Dual - Two GKE public clusters, Cluster Registration, ASM installation, ACM installation

Next iteration:

Dual Private Cluster setup, with a bastion host (More along the lines of real world setup)

Anthos Benefits:
* Kubernetes Everywhere (and under your control)
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

You will need to create a VPC network with a subnet and two secondary IP ranges based on how many clusters you would like to build

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
secondary_region      = "" (not in single)  
secondary_zones      = [""] (not in single)  
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
cd to the **single** or **dual** folder
Fill out terraform.tfvars  
You start with (variables.tf, terraform.tfvars, main.tf and apis.tf)  
terraform init  
Initializes your provider, downloads module and builds your state.
terraform plan  
terraform apply  (-auto-approve if you want to skip the 'yes' prompt)

Initializes the state and enables the required APIs.

After completion, copy each of the files (in order) out of **holdingbay** into your **single** or **dual** folder.

After each copy repeat the terraform steps:

terraform init
terraform plan
terraform apply  (-auto-approve if you want to skip the 'yes' prompt)

#### Building your cluster(s)

Sets up your GKE cluster(s) in your project. 
clusters.tf

#### Registering your clusters to an Anthos environ

Cluster registration. 
hub.tf

#### Anthos Service Mesh (ASM)

Installs Anthos Service Mesh (ASM)  
asm.tf

#### Anthos Config Management (ACM)

Enables Anthos Config Management (ACM)  
acm.tf

#### Beyond the setup

Application Deployment (Online Boutique or Bank of Anthos)   
Working with Config Management (Config Sync and Policy Controller)  
Working with Service Mesh

<!-- Repo Strcuture -->
## Repo Structure
```
single/         # Single Cluster Build         
dual/           # Dual Cluster Build                

```


<!-- Resource LINKS  -->
## Resources

[Anthos](https://cloud.google.com/anthos)

[Anthos Service Mesh Documentation](https://cloud.google.com/service-mesh/docs)
[Terraform Kubernetes Engine ASM Submodule](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest/submodules/asm)

[Anthos Config Management Documentation](https://cloud.google.com/anthos-config-management/docs)
[Terraform Kubernetes Engine ACM Submodule](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest/submodules/acm)

Build documented gotchas into the instructions for the next iteration.
Go back and run from a vanilla machine to ensure nothing has been overlooked or assumed.
Review perodically for improvements.

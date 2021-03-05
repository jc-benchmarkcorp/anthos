# Primary Cluster

data "google_client_config" "default" {}

provider "kubernetes" {
  load_config_file       = false
  host                   = "https://${module.primary-cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.primary-cluster.ca_certificate)
}

module "primary-cluster" {
  name                    = "primary"
  project_id              = module.project-services.project_id
  source                  = "terraform-google-modules/kubernetes-engine/google//modules/beta-public-cluster"
  regional                = false
  region                  = var.primary_region
  network                 = "kube"
  subnetwork              = "kube-subnet"
  ip_range_pods           = "gke-pods-1"
  ip_range_services       = "gke-services-1"
  zones                   = var.primary_zones
  release_channel         = "REGULAR"
  cloudrun                = true
  cluster_resource_labels = { "mesh_id" : "proj-${data.google_project.project.number}" }
  node_pools = [
    {
      name         = "default-node-pool"
      min_count    = 1
      max_count    = 10
      autoscaling  = false
      auto_upgrade = true
      node_count   = 5
      machine_type = "e2-standard-4"
    },
  ]
}
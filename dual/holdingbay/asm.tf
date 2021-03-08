module "asm-primary" {
  source           = "github.com/terraform-google-modules/terraform-google-kubernetes-engine//modules/asm"
  project_id       = data.google_client_config.current.project
  cluster_name     = module.primary-cluster.name
  location         = module.primary-cluster.location
  cluster_endpoint = module.primary-cluster.endpoint
  asm_dir = "asm-dir-${module.primary-cluster.name}"
  asm_version = "1.9"
  gcloud_sdk_version = "330.0.0"
}

module "asm-secondary" {
  source           = "github.com/terraform-google-modules/terraform-google-kubernetes-engine//modules/asm"
  project_id       = data.google_client_config.current.project
  cluster_name     = module.secondary-cluster.name
  location         = module.secondary-cluster.location
  cluster_endpoint = module.secondary-cluster.endpoint
  asm_dir = "asm-dir-${module.secondary-cluster.name}"
  asm_version = "1.9"
  gcloud_sdk_version = "330.0.0"
}
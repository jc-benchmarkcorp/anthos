module "acm-primary" {
  source           = "terraform-google-modules/kubernetes-engine/google//modules/acm"
  project_id       = data.google_client_config.current.project
  cluster_name     = module.primary-cluster.name
  location         = module.primary-cluster.location
  cluster_endpoint = module.primary-cluster.endpoint
  create_ssh_key   = false
  secret_type      = "none"
  sync_repo        = var.acm_repo_location
  sync_branch      = var.acm_branch
  policy_dir       = var.acm_dir
}

module "acm-secondary" {
  source           = "terraform-google-modules/kubernetes-engine/google//modules/acm"
  project_id       = data.google_client_config.current.project
  cluster_name     = module.secondary-cluster.name
  location         = module.secondary-cluster.location
  cluster_endpoint = module.secondary-cluster.endpoint
  create_ssh_key   = false
  secret_type      = "none"
  sync_repo        = var.acm_repo_location
  sync_branch      = var.acm_branch
  policy_dir       = var.acm_dir
}
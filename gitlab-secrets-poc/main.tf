module "random" {
  source = "./modules/random_password"
}

module "gitlab_secrets" {
  source     = "./modules/gitlab_secrets"
  project_id = var.project_id
  secrets = {
    MY_SECRET_KEY11 = {
      value     = module.random.password
    }
    MY_SECRET_KEY_222 = {
      value     = "howare_${module.random.password}_you"
    }
  }
}

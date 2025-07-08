terraform {
  cloud {
    organization = "openstack-poc"

    workspaces {
      name = "dev"
    }
  }
}

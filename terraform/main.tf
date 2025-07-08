terraform {
  cloud {
    organization = "beatlos"

    workspaces {
      name = "openstack-poc"
    }
  }
}

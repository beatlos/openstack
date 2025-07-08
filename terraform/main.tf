terraform {
  cloud {
    organization = "beatlos"

    workspaces {
      name = "hetzner"
    }
  }
}

resource "hcloud_network" "network" {
  name     = "network"
  ip_range = "172.16.0.0/16"
}

resource "hcloud_network_subnet" "network-subnet" {
  type         = "cloud"
  network_id   = hcloud_network.network.id
  network_zone = "eu-central"
  ip_range     = "172.16.1.0/24"
}

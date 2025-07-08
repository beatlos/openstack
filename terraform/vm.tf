resource "hcloud_server" "server" {
  name        = "azurecast"
  server_type = "cpx11"
  image       = "ubuntu-24.04"
  location    = "nbg1"
  ssh_keys    = [hcloud_ssh_key.default.id]

  firewall_ids = [
    hcloud_firewall.web.id,
    hcloud_firewall.admin.id
  ]

  network {
    network_id = hcloud_network.network.id
    ip         = "10.0.1.5"
  }

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  depends_on = [
    hcloud_network_subnet.network-subnet
  ]
}

# Create a new SSH key
resource "hcloud_ssh_key" "default" {
  name       = "automation"
  public_key = var.ssh_public_key
}

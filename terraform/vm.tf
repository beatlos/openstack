
resource "hcloud_server" "servers" {
  for_each    = var.servers
  name        = each.key
  server_type = each.value.type
  image       = "ubuntu-24.04"
  location    = "nbg1"
  ssh_keys    = [hcloud_ssh_key.default.id]

  firewall_ids = [
    hcloud_firewall.web.id,
    hcloud_firewall.admin.id
  ]

  network {
    network_id = hcloud_network.network.id
    ip         = each.value.ip
  }

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  depends_on = [hcloud_network_subnet.network-subnet]
}


# Create a new SSH key
resource "hcloud_ssh_key" "default" {
  name       = "automation"
  public_key = var.ssh_public_key
}

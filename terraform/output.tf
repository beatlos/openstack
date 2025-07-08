output "public_ips" {
  description = "Public IPv4 addresses of all servers"
  value = {
    for name, server in hcloud_server.servers :
    name => server.ipv4_address
  }
}

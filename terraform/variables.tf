variable "hcloud_token" {
  description = "Token for Hetzner Cloud"
  type        = string
  sensitive   = true
}

# Define a variable for the SSH public key
variable "ssh_public_key" {
  description = "The SSH public key"
  type        = string
}

resource "digitalocean_domain" "my_domain" {
   name = var.my_host
   ip_address = digitalocean_droplet.www-1.ipv4_address
}
resource "digitalocean_record" "cool-frogs" {
  domain = digitalocean_domain.my_domain.id
  type   = "A"
  name   = "cool-frogs"
  value  = digitalocean_droplet.www-2.ipv4_address  # Auto-updates with Droplet IP


}

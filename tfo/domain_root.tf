resource "digitalocean_domain" "my_domain" {
   name = var.my_host
}
resource "digitalocean_record" "web" {
  domain = digitalocean_domain.my_domain.id
  type   = "A"
  name   = "web"
  value  = digitalocean_droplet.www-1.ipv4_address  # Auto-updates with Droplet IP


}

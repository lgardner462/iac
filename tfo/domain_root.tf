resource "digitalocean_domain" "mrbonuts" {
   name = "mrbonuts.com"
}
resource "digitalocean_record" "web" {
  domain = digitalocean_domain.mrbonuts.id
  type   = "A"
  name   = "web"
  value  = digitalocean_droplet.www-1.ipv4_address  # Auto-updates with Droplet IP


}

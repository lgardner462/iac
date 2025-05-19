resource "digitalocean_record" "CNAME-www" {
  domain = digitalocean_domain.mrbonuts.name
  type = "CNAME"
  name = "www"
  value = "@"
}

resource "digitalocean_record" "CNAME-www" {
  domain = digitalocean_domain.my_domain.name
  type = "CNAME"
  name = "www"
  value = "@"
}

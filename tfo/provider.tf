#specify provider
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
#declare variables but leave blank so they aren't hard coded
variable "do_token" {}
variable "pvt_key" {}

#get token from variable do_token at run time
provider "digitalocean" {
  token = var.do_token
}

#add ssh key to any provisioned droplets
data "digitalocean_ssh_key" "doce" {
  name = "doce"
}

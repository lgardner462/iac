#specify provider
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  cloud { 
    
    organization = "mrbonuts" 

    workspaces { 
      name = "mrbonuts-cli" 
    } 
  } 
}
##declare variables but leave blank so they aren't hard coded, this breaks hashicloud deploy...
variable "pvt_key"  {}
variable "do_token" {}
variable "my_host" {}
#get token from variable do_token at run time
provider "digitalocean" {
  token = var.do_token
}

#add ssh key to any provisioned droplets
data "digitalocean_ssh_key" "doce" {
  name = "doce"
}

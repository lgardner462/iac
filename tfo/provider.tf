#specify provider
terraform {
  required_version = "~> 1.12"
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
variable "pvt_key"  {
  type = string
}
variable "do_token" {
  type = string 
}
variable "my_host" {
  type = string 
}
variable "gitrepo" {
  type = string 
}
variable "playbook" {
  type = string
}
variable "deploy_key" {
  type = string 
}
variable "ansible-vault" {
  type = string
}
#get token from variable do_token at run time
provider "digitalocean" {
  token = var.do_token
}

#add ssh key to any provisioned droplets
data "digitalocean_ssh_key" "doce" {
  name = "doce"
}

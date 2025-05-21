resource "digitalocean_droplet" "www-2" {
    image = "ubuntu-22-04-x64"
    name = "www-2"
    region = "nyc3"
    size = "s-1vcpu-1gb"
    ssh_keys = [
      data.digitalocean_ssh_key.doce.id
    ]
connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = var.pvt_key
    timeout = "2m"
  }
provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }
}

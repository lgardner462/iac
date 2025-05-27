resource "digitalocean_droplet" "frog-1" {
    image = "ubuntu-22-04-x64"
    name = "frog-1"
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
      #
      "export PATH=$PATH:/usr/bin",
      "sudo apt update",
      "sudo apt install -y nginx ansible",
      "echo '${var.deploy_key}' > ~/.ssh/id_ed25519",
      #make sure dnf is available post cloud-init but pre-ansible
#      "for i in {1..10}; do sudo dnf check-update && break || sleep 10 ; done",
      "sleep 60"
      "chmod 600 ~/.ssh/id_ed25519",
      "/usr/bin/ansible-pull --private-key ~/.ssh/id_ed25519 --accept-host-key --verbose --url ${var.gitrepo} --directory /var/local/src/instance-bootstrap ${var.playbook}"
    ]
  }
}

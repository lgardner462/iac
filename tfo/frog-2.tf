resource "digitalocean_droplet" "frog-2" {
    image = "ubuntu-22-04-x64"
    name = "frog-2"
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
      "sudo apt update",
      "sudo apt install -y nginx ansible",
      "sudo ansible-galaxy collection install community.digitalocean",
      "sudo echo foo > /tmp/.foo",
      "sudo echo '${var.ansible-vault}' > /root/.vault",
      "sudo echo '${var.deploy_key}' > /root/.ssh/id_ed25519",
      #make sure dnf is available post cloud-init but pre-ansible
      #"for i in {1..10}; do sudo dnf check-update && break || sleep 10 ; done",
      "sleep 120",
      "sudo chmod 600 /root/.ssh/id_ed25519",
      "sudo /usr/bin/ansible-pull --private-key /root/.ssh/id_ed25519 --accept-host-key --verbose --url ${var.gitrepo} --directory /var/local/src/instance-bootstrap --vault-password-file /root/.vault ${var.playbook}",
    ]
  }
}

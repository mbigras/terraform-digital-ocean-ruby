variable "do_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
  version = "~> 0.1"
}

resource "digitalocean_ssh_key" "default" {
  name = "tmp key"
  public_key = "${file("id_rsa.pub")}"
}

resource "digitalocean_droplet" "web" {
  name = "somehost"
  image = "centos-7-x64"
  region = "sfo2"
  size = "512mb"
  ssh_keys = [
    "${digitalocean_ssh_key.default.fingerprint}"
  ]
}

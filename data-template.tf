data "template_file" "ansible_installation" {
  template = file("${path.module}/bootstrap.txt")
}

data "template_file" "pubkey_installation" {
  template = file("${path.module}/pubkey.txt")
}
data "template_file" "dependencies_installation" {
  template = file("${path.module}/Scripts/dependencies.sh")
}

data "template_file" "localpubkey_installation" {
  template = file("${path.module}/Scripts/localpubkey.sh")
}
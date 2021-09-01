data "template_file" "localpubkey_installation" {
  template = file("${path.module}/Scripts/localpubkey.sh")
}
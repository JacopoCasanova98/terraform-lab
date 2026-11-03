resource "local_file" "ignore_changes" {
  filename = "ignore_changes.txt"
  content  = "Contenuto gestito da Terraform"

  lifecycle {
    ignore_changes = [
      content
    ]
  }
}
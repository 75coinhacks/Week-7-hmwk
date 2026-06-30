# Generic text file that will be created by Terraform using the local

resource "local_file" "favorite_food" {
  content  = "My favorite food is chicken and fries."
  filename = "${path.module}/favoritefood.txt"

  lifecycle {
    prevent_destroy = true
  }
}

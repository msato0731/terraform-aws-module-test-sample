variable "prefix" {}
variable "name" {}


resource "aws_sqs_queue" "this" {
  name                    = "${prefix}-${name}"
  sqs_managed_sse_enabled = true
}

output "quque_url" {
  value = aws_sqs_queue.this.url
}

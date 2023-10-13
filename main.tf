variable "prefix" {}
variable "name" {}


resource "aws_sqs_queue" "this" {
  name                    = "${var.prefix}-${var.name}"
  sqs_managed_sse_enabled = false
}

output "queue_url" {
  value = aws_sqs_queue.this.url
}

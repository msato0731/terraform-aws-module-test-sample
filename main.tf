variable "prefix" {}
variable "name" {}


resource "aws_sqs_queue" "this" {
  name                    = "${var.prefix}-${var.name}"
  sqs_managed_sse_enabled = true
}

output "queue_url" {
  value = aws_sqs_queue.this.url
}

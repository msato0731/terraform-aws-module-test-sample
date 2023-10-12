

# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

variables {
  prefix = "test"
  name   = "queue"
}

run "attributes_validation" {
  assert {
    condition     = aws_sqs_queue.this.name == "test-queue"
    error_message = "incorrect value for queue name"
  }

  assert {
    condition     = aws_sqs_queue.this.sqs_managed_sse_enabled == true
    error_message = "incorrect value for sqs_managed_sse_enabled"
  }
}

run "output_validation" {
  assert {
    condition     = output.queue_url == aws_sqs_queue.this.url
    error_message = "incorrect value for queue url"
  }
}
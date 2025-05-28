variable "prefix" {}
variable "name" {}

provider "aws" {
  region = "ap-northeast-1" # 必要に応じて適切なリージョンに変更してください
}

resource "aws_sqs_queue" "this" {
  name                    = "${var.prefix}-${var.name}"
  sqs_managed_sse_enabled = true
}

# null_resourceを使ってterraform providersコマンドを実行
resource "null_resource" "get_terraform_providers" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "terraform providers > terraform_providers_output.txt"
  }
}

# terraform providers コマンドの出力結果をファイルから読み込む
data "local_file" "terraform_providers_output" {
  filename   = "${path.module}/terraform_providers_output.txt"
  depends_on = [null_resource.get_terraform_providers]
}

output "queue_url" {
  value = aws_sqs_queue.this.url
}


# # terraform providers コマンドの出力結果
output "terraform_providers_output" {
  value = data.local_file.terraform_providers_output.content
}

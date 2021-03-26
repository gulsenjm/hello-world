variable "deployment_image" {
  default = "docker.tapjangul.com/hello-world-app:latest"
}
variable "deployment_environment" {
    default = "stage"
}

variable "deployment_endpoint" {
  type = "map"
  default = {
    dev  = "dev.hello"
    qa   = "qa.hello"
    prod = "hello"
    stage = "stage.hello"
  }
}

variable "google_domain_name" {
  default = "tapjangul.com"
}

output "application_endpoint" {
  value = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
}

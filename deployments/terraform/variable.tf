variable "deployment_image" {
  default = "docker.tapjangul.com/hello-world-app-dev-feature:b00f3ed"
}
variable "deployment_environment" {
    default = "dev"
}

variable "deployment_name" {
    default = "hello-world"
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



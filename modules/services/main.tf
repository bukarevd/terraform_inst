provider "aws" {
  region = "us-east-1"
}

variable "cluster_name" {
  description = "claster name"
}

variable "min" {
default = "3"
}

variable "max" {
default = "11"
}
module "backend_example" {
   source = "github.com/bukarevd/terraform_inst/modules/services/backend"
  cluster_name = "${var.cluster_name}"
   }


output "publicip" {
  value = "${module.backend_example.public_ip}"
}

output "instance" {
  value = "${module.backend_example.instance}"
}


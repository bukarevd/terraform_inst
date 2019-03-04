provider "aws" {
  region = "us-east-1"
}
 module "backend_example" {
   source = "."
 }
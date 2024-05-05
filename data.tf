data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-statefile-saurabh"
    key    = "dev/terraform-vpc/teraform.tfstate"
    region = "us-east-1"
  }
}

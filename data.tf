data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terraform-statefile-saurabh"
    key    = "dev/terraform-vpc/teraform.tfstate"
    region = "us-east-1"
  }
}

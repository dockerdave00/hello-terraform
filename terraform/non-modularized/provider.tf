provider "aws" {
  profile = "default"
  region  = "${var.AWS_REGION}"
}
# small change to trigger version control

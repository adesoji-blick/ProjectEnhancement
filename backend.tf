provider "aws" {
  profile = var.profile
  region  = var.region
}

terraform {
  backend "s3" {
    bucket = "ijoseda-devops"
    key    = "Devops2021/DevopsProject/finalproject-statefile"
    region = "ca-central-1"
  }
}
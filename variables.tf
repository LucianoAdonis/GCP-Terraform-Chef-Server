variable "gcp_account_path" {}
variable "gcp_project_id" {}

### Account ###

variable "region" {
  default = "us-east1-b"
}

variable "name" {
  default = "chef-server"
}

### Instance ###

variable "machine_type" {
  description = "It doesn't work with a small machine"
  default = "n1-standard-2"
}

variable "machine_image" {
  default = "centos-7-v20180227"
}

### Keys ###

variable "user_ssh" {
  default = ""
}

variable "user_key" {
  default = ""
}

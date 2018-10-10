provider "google" {
  version     = "~> 1.12.0"
  credentials = "${var.gcp_account_path}"
  project     = "${var.gcp_project_id}"
  region      = "${var.region}"
}

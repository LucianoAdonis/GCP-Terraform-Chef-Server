# Terraform Google Cloud Computing #



### What is this repository for? ###

I just wanted to make a quick Chef Server to play with on GCP without much effort.

Get Started:
* I assume that you already have your service account for this project. If not, look [here](https://github.com/LucianoAdonis/Modulo-de-Terraform-para-GCP#prerrequisitos).
* Follow the steps for "Creating a new SSH key" and "Adding or removing project-wide public SSH keys on this [link](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys). You will be using that key to provision the script on the Chef-Server.

### How do I get set up? ###

In the `variables.tf` file you need to edit the name of your private key and the username that you used to create it. Off course, you can modify other values. In the case of "machine_type", the minimun size should be at least "n1-standard-2".

Edit the values in the `chef-server.sh` script.

Then you need to create the `terraform.tfvars` file with the following parameters:

```
gcp_project_id = "your-service-account-id"
gcp_account_path = "your-service-account.json"
```

Run terraform.
```
make apply
```

After you are done with that, you need to login into the chef-server and execute as root:

```
sudo chef-manage-ctl reconfigure
```

To read the policies or just press "q" and then `yes`. Hadouken.
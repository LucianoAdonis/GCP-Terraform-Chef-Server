#!/usr/bin/env bash

ADMIN="chef-admin"
ADMIN_PASS="Insecure-Password.!"
ADMIN_MAIL="chefadmin@energon.com"
CHEF_ORG="Energon"

yum -y install wget
wget https://packages.chef.io/files/stable/chef-server/12.17.33/el/7/chef-server-core-12.17.33-1.el7.x86_64.rpm
sudo rpm -Uvh chef-server-core-12.17.33-1.el7.x86_64.rpm
sudo chef-server-ctl reconfigure
sudo chef-server-ctl user-create $ADMIN Chef Admin $ADMIN_MAIL $ADMIN_PASS --filename $ADMIN.pem
sudo chef-server-ctl org-create $CHEF_ORG "Energon, Inc." --association_user $ADMIN --filename $CHEF_ORG.pem
sudo chef-server-ctl install chef-manage
sudo chef-server-ctl reconfigure

clean:
	@rm -f terraform.tfstate*
	@rm -Rf .*

initialize:
	@terraform init

apply: initialize
	@test -d $(CURDIR)/.terraform && terraform apply || \
    /bin/echo "[ERROR]"

restart:
	@terraform destroy --auto-approve
	@terraform apply --auto-approve
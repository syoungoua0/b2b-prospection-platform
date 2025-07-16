.PHONY: init plan apply destroy

default: plan

init:
	cd infra/terraform && terraform init

plan:
	cd infra/terraform && terraform plan -var "subnet_ids=$(SUBNET_IDS)"

apply:
	cd infra/terraform && terraform apply -auto-approve -var "subnet_ids=$(SUBNET_IDS)"

destroy:
	cd infra/terraform && terraform destroy -auto-approve -var "subnet_ids=$(SUBNET_IDS)"

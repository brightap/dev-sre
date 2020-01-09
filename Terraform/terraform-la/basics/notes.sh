#terraform commands
terraform apply
terraform plan

#validate changes
terraform validate

#destroy deployments
terraform destroy

#plan the dev env
terraform plan -out=tfdev_plan -var env=dev

#apply the dev env
terraform apply tfdev_plan

#plan the prod env
terraform plan -out=tfprod_plan -var env=prod

#apply the prod env
terraform apply tfprod_plan

#destroy prod deployment
terraform destroy -var env=prod -auto-approve

#use environments variables
export TF_VAR_env=prod

#unset environment variables
unset TF_VAR_env

#create a workspace
terraform workspace new dev | terraform workspace new prod

#change workspace
terraform workspace new prod

#select default workspace | select environment 
terraform workspace select default | terraform workspace select prod

#show workspace
terraform workspace show
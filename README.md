# awspipeline

# AWSserverless-deploy-pipeline

# terraform
cd terraform/
terraform init
terraform plan -out=tfplan
terraform show -json tfplan > tfplan.json
./opa eval -i terraform/tfplan.json -d policies/tf/ "data.terraform.deny" --format pretty

# cloudformation
./opa eval -i templates/meu-template.yaml -d policies/cfn/ "data.cloudformation.deny" --format pretty
## SRAssesment - Level 3
# Build a ECS cluster in AWS using Terraform and build a CI/CD flow using Jenkins that will monitor git repository for changes to a docker file, build and push the dockerfile to ECR and deploy it to ECS for testing.

# Servers created using Terraform
- ECS cluster and Jenkins

- Clone git repo to you machine and copy your pem file to the diretory
- "git clone https://github.com/sbuyakar/SRAssesment.git" 

# Terraform
- Go to Option2 folder, there should be .tf files available.
- Change values in terraform.tfvars
- Run "terraform plan"
- Run "terraform apply" or "terraform apply --auto-approve" if you want to skip aprrove message

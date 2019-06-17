# SRAssesment

# Ansible 
# To install nginx, upload a sample index.html and start nginx
- Edit hosts file with node IP or domain name
- Run the main.yml file from Ansible Control Server
"ansible-playbook -i hosts main.yml"


# Terraform
Prerequisites:
1. EC2 key pair

- Clone git repo to you machine and copy your pem file to the diretory
- Run "terraform apply"

# Docker
- Clone git repo to you machine 
- Build the docker image "docker build -t webapp-image:v1 ."
-Run docker image "docker run -d -p 80:80 webapp-image:v1"
-Run docker compose "docker-compose up"

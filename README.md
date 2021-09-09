**********************
Direction App Project
**********************
### INFRASTRUCTURE BUILD 

To build all infrastructure with shell script, run cmd below
```
sh infrastructure.sh    
```
or 

### To Build AMI with Java 11
```
pwd
~/ ../MiniProjectFour
cd PackerAMI/
Packer init .
Packer build .
cd ../
```

## To Build ec2 Instances
```
terraform init
terraform plan
terraform apply --auto-approve
```

To run ansible tasks on all infrastructure built,
## Execute Ansible Tasks
```
ssh ec2-user[tool(ansible)server.ip]
git clone https://github.com/adesoji-blick/ProjectEnhancement.git
cd ProjectEnhancement/AnsibleTASK/
sh ansible_task.sh

```

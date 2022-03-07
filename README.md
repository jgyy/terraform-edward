# terraform-edward
Learn how to automate your infrastructure with terraform. Covers Terraform with AWS, Packer, Docker, ECS, EKS, Jenkins

## running terraform scripts
This is the steps i used to quickly run terraform scripts

```bash
terraform init
echo yes | terraform apply
echo yes | terraform destroy
```

## Creating ssh-keygen
As it is not secure to dump public or private key in the repo, i have placed in the temp folder instead

```bash
ssh-keygen -f /tmp/mykey
```

## Deleting .terraform folder
Do remove the .terraform folder as it is consuming a lot of local storage

```bash
rm -rf .terra*
```
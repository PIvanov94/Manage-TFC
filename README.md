# 

This project will help users to create various of recourses (project, workspaces, variable sets) in HCP Terraform/Terraform Cloud. 

#

## First steps:

1. Register a HCP Terraform/Terraform Cloud account - [HCP Terraform](https://app.terraform.io/).

2. Create a FREE tier HCP Terraform/Terraform Cloud organization.

3. Install Terraform.


## Install Terraform

To use Terraform you will need to install it. HashiCorp distributes Terraform as a binary package. You can also install Terraform using popular package managers.

Refer to official HashiCorp documentation how to install Terraform depending on your OS:

[Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Set up your HCP Terraform API Token

When you set all the requirements mentioned above, you need to authenticate via terraform login command into the command line.

From the terminal when you have Terraform installed, run the following command:

```bash
terraform login
```
You will be prompted to create an API Token. Follow the steps to create the token.

Keep in mind that this is the only time when you will be able to see this token. Put it somewhere safe (key-vault or password manager).

Once you receive the token, you need to paste it into your command line as is required.

If successful, you should see a message welcoming you to HCP Terraform.


## Create resources

Once you have logged in successfully to HCP Terraform, you can create the needed resources with Terraform.

Please follow these  steps:

1. Run the following commands in hcpcloud-create-project instance to create a project in your organization:

```bash
terraform init
```
```bash
terraform plan
```
```bash
terraform apply
```

Put the needed information in command line as is the required.

2. Run the same commands in cli-create-workspace instance to create three workspaces with CLI-driven workflow.

Put the needed information in command line as is the required.

3. To create a workspace with VCS-driven workflow, you need to set up Github App OAuth Token.

4. In HCP Terraform, navigate to Account settings -> Tokens -> Create a Github App OAuth Token.

5. Follow the steps to configure OAuth Token and repository.

6. When done you must run the mentioned above Terraform commands (init, plan, apply) in vcs-create-workspace instance to create a workspace with VCS-driven workflow.

Put the needed information in command line as is the required.

7. To create a variable set containing: a terraform variable and an environment variable applied to all CLI workspaces, run the Terraform commands in create-variable-set instance.

Put the needed information in command line as is the required.

After completing all the steps you will have created a project, workspace with VCS-driven workflow, three workspaces with CLI-driven workflow and a variable set applied to the three CLI-driven workspaces.
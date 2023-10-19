# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to utlize semantic versioning for its tagging.
[semver.org](https://semver.org/)

The general format:

**MAJOR.MINOR.PATCH**, eg. '1.0.1'

-   **MAJOR** version when you make incompatible API changes
-   **MINOR** version when you add functionality in a backward compatible manner
-   **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

### Considerations with the Terraform CLI changes
The Terraform CLI installation Instructions have changed due to gpg keyring changes. So we needed to refer the latest install CLI instructions via Terraform Documentation and change the scripting for install. 

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


### Considerations for Linux Distro

This project is build against Ubuntu.
Please consider checking your Linux Distribution and change accordingly to your OS requirements.

[How to Check OS version in Linux ](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/
)
Example of Checking OS Version:
```
$ cat /etc/os-release 
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```
### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg depreciation issues we notice that bash scripts steps were a considerable amount more code. So we decided to create a bash script to install the Terraform CLI.

Bash script located here: [./bin/install-terraform.sh](./bin/install-terraform.sh)

- This will keep the Gitpod Task file ([.gitpod.yml](.gitpod.yml)) tidy.
- This allows us an easier to debug and execute manually Terraform CLI install.
- This will allow better portability for other projects which need terraform cli

##### Shebang

A Shebang tells the bash script what program that will intepret the script. eg. `#!/bin/bash`

- for portability for different OS distributions
- will search the users PATH for the bash executable

https://en.wikipedia.org/wiki/Shebang_(Unix)


#### Execution Considerations
When executing the bash script we can use the `./` shorthand notifcation to execute the bash script.
eg. `./bin/install-terraform.sh`

If you are using a script in .gitpod.yml we need to point the script to a program to interpret it.
eg. ` source ./bin/install-terraform.sh`

#### Linux Permissions Considerations
In order to make our bash scripts executable we need to change linux permissions for the fix to be executable at the user mode.
` chmod u+x ./bin/install-terraform.sh`


https://en.wikipedia.org/wiki/Chmod

### Working with Env Vars

We can list out all Environment variables (ENV vars) using the `env` command
We can filter specific env vars using grep eg. `env | grep_AWS_`

#### Setting and Unsetting ENV Vars

In the terminal we can set using `export HELLO=world`

In the terminal we can unset using `unset HELLO`

We can set an env vars termporarily when just running a command
```sh
HELLO='world' ./bin/print_message
```
Withing a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO 'world'

echo $HELLO
```

#### Priting Vars

We can print an env var using echo eg. `echo $HELLO`

#### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.
If you want to Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod
we can persist env vars into gitpod by storing them in gitpod Secrets Storage.

```

gp env HELLO='world'
``````

### AWS CLI Installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Getting Started Install (AWS-CLI) ](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[Setting Environment Variables for AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

Note: We'll need to generate AWS CLI Credentials from IAM User in order to use AWS CLI.

We can check if our AWS Credentials is configured correctly by running the following AWS CLI Command: 

```sh
aws sts get-caller-identity
```
If its  successful you should see a json payload return that looks like this:

```json
{
    "UserId": "ABCDEFGHIJKLMNOPQRST",
    "Account": "1234567891012",
    "Arn": "arn:aws:iam::1234567891012:user/terraform-bbuser"
}
```

## Terraform Basics

### Terraform Registry

Terraform sources their providers and modules from the Terraform registry which is located at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** is an interfavce to APIs that will allow to create resources in terraform.
- **Modules** are a way to make large amounts of code modular, portable and sharable.

[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random/)

### Terraform Console

We can see a list of all the Terraform Commands by simply typing `terraform`

### Terraform Init

At the start of a new terraform project we will run `terraform init` to download the binaries for  the terraform providers we will use for this project.

### Terraform Plan
`terraform plan`
This will generate an output of  a changeset, about the state of our infrastructure and what will be changed.
We can output this changeset ie. "plan" to be passed to an apply , but often you can just ignore outputting.

### Terraform Apply
`terraform apply`
This will run a plan and pass the changeset to be executed by terraform. Apply should prompt yes or no.

If we want to automatically approve an apply we can provide the auto approve flag eg. ` terraform apply --auto-approve`

#### Terraform Destroy

This will destroy resources which has been created by terraform .
Tip: Use `terraform destroy --auto-approve` to get rid of all the resources which was created from that directory & state.

### Terraform Lock Files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project.

The Terraform Lock file should be committed to your Version Control System. eg: Github etc

### Terraform State Files 

`.terraform.tfstate` contains information about the current state of your infrastructure.

This file **should no tbe committed** to your VCS. (make sure to add it to .gitignore file)

This file can contain sensitive information.

If you lose this file you will lose last known state of your infrastructure.

`.terraform.tfstate.backup` is the previous state file backup.

### Terraform Directory

`.terraform` directory contains binaries of terraform providers.
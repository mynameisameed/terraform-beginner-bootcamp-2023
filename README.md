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


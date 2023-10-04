# SNO Install Guide 

Follow this guide to install single node OpenShift (SNO) in your AWS account. The script provisions an EC2 instance and installs a single node OpenShift on that instance.

## Prerequisites

- Linux or equivalent workstation.
- Clone this repo on your workstation. (`git clone `)
- Install CLIs for AWS, OpenShift and other tools (See instructions below.)
- AWS key and secret (Review the configuration table below for additional prerequisites.)

## Deploy cluster

1. Install Prerequisites

    ```
    cd src/sno; ./installCLI.sh
    ```
1. Setup the installation configuration. 
    
    `cd src/sno` and edit the script `setupVars`
    
    Set the parameters as described in the table below:

    | Property | Description | Example value |
    | -------- | ----------- | ------------- |
    | `AWS_ACCESS_KEY_ID`|  [AWS access key id](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) | `random-string` |
    | `AWS_SECRET_ACCESS_KEY`|  [AWS secret access key](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) | `random-string` |
    | `AWS_REGION`|  [AWS region](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) | `us-east-1` |
    | `CLUSTER_NAME` | Short name to identify the cluster | `mas-demo`|
    | `BASE_DOMAIN` | [Set up a subdomain in AWS](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/CreatingNewSubdomain.html) | `awsocp.buildlab.cloud`|
    | `PULL_SECRET_FILE` | Save the [Red Hat's container registries](https://console.redhat.com/openshift/downloads#tool-pull-secret) into the file `pull-secret.txt` | `./pull-secret.txt`|

1. Run the install script.
    ```
    ./deploy.sh
    ````

## Use cluster

Finding cluster credentials:

Credentials for the cluster will be echoed to stdout at the end of the
installation. You can also find these credentials in the workdir at
`./_workdir/auth`.

The cluster will be accessible at this URL:
`https://console-openshift-console.apps.${CLUSTER_NAME}.${BASE_DOMAIN}`, e.g.
`https://console-openshift-console.apps.mas-demo.awsocp.buildlab.cloud/`.


Note:
Cluster state will be saved in this directory at `./_workdir/`. Rename or move this
directory to retain it so that you can later destroy the cluster or get
credentials for it. It uses Terraform and relies on its `tfstate` file.

`deploy.sh` will exit if a workdir already exists. Configure it to overwrite the
current workdir by setting env var `OVERWRITE=1`; configure it to resume a
previous installation by setting env var `RESUME=1`.


## Uninstall cluster

Run `./destroy.sh` to destroy the cluster and AWS resources.

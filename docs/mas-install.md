# MAS Manage Install Guide 

Install Maximo Application Suite - Manage on a Single Node OpenShift.

## Prerequisites

- Linux or equivalent workstation.
- A SNO cluster (refer to [SNO install](./sno-install.md))
- Get MAS install license file from the partner portal or your IBM representative. Store the file under the `src/mas` directory as `license.dat`.
- Download the [IBM entitlement key](https://myibm.ibm.com/products-services/containerlibrary)

## Deploy MAS Manage

1. Login into the cluster.
    Login to the cluster via the CLI using the admin credentials from the OpenShift web console.

    ```
    oc login --token=xxxx --server=https://myocpserver
    ```

1. Setup the installation configuration. 
    `cd src/mas` and edit the script `setupVars`

    Set the parameters as described in the table below:

    | Property | Description | Example value |
    | -------- | ----------- | ------------- |
    | `CLUSTER_NAME` | Short name to identify the mas instance | `mas-demo`|
    | `IBM_ENTITLEMENT_KEY` | Enter the IBM entitlement key here | `random-string`|


1. Run the install script.
    ```
    ./masInst
    ````

## Use Manage instance

Credentials for the manage instance will be echoed to stdout towards the end of the
installation. The credentials will appear in the format shown below:

```
"Maximo Application Suite is Ready, use the superuser credentials to authenticate",
"Admin Dashboard ... https://admin.masdemo.apps.mas-demo.awsocp.buildlab.cloud",
"Username .......... lIfdskskNJEw3sserIDSF7SvbTgYFwww",
"Password .......... 5JwkM5zYMnmbS38AsdgShe4Sa3aa32Sa"
```

Note:
The mas install log is saved in the `masdevops` pod under the `masloc/ansible-devops/ibm/mas_devops` directory.


## Configuring MAS admin user
TODO: Add admin instructions here.

## Uninstall Manage
TODO: Add uninstall instructions here.

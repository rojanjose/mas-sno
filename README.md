# MAS * SNO * AWS

Provision a low footprint Maximo Manage environment on AWS.

(Note: This installation was verified on MacOS 13.5 only)

1. Install Openshift

    Provision EC2 instance and [install single node OpenShift](./docs/sno-install.md)

1. Install Maximo Manage
    
    Install a [Maximo Manage](./docs/mas-install.md) instance.

1. Shutdown and restart the environment
    
    Instructions to [stop and start the environment](./docs/sno-shutdown.md)
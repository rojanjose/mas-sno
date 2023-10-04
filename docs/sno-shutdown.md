# Environment shutdown

Warning: The instructions in this section describes the procedure to bring the environment down. Thought it accomplishes the desired outcome, there are certain [risks](https://docs.openshift.com/container-platform/4.12/backup_and_restore/graceful-cluster-shutdown.html) associated with shutting down the environment.

## Backup etcd

1. Setup a crontask for regular backups of /etcd database.
    Login to the cluster using the admin credentials and run the following command:

    ```
    cd src/sno
    ./setupOCPBackup
    ```

    This is a scheduled backup and setup as a one time activity.

## Shutdown environment

1. Run this script to bring down the manage pods.
    ```
    cd src/mas
    ./shutdownMAS
    ```

1. Shut down the OCP
    Login to the cluster using the admin credentials and run the following command:

    ```
    cd src/sno
    ./shutdownOCP
    ```

## Startup environment

1. Run the script to restart the environment

    ```
    cd src/sno
    ./startupOCP <ec2-instance-tag>
    ```

1. Run this script to start up the manage pods.
    ```
    cd src/mas
    ./startupMAS
    ```
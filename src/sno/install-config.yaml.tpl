# schema: https://github.com/openshift/installer/blob/master/pkg/types/installconfig.go
apiVersion: v1
metadata:
  name: ${CLUSTER_NAME}
baseDomain: ${BASE_DOMAIN}
controlPlane:
  name: master
  replicas: ${CONTROLPLANE_REPLICAS}
  architecture: amd64
  hyperthreading: Enabled
  platform:
    aws:
      defaultMachinePlatform:
        type: ${EC2_TYPE}
compute:
- name: worker
  architecture: amd64
  hyperthreading: Enabled  
  platform:
    aws:
      defaultMachinePlatform:
        type: ${EC2_TYPE}
  replicas: ${COMPUTE_REPLICAS}
networking:
  networkType: OVNKubernetes
  clusterNetwork:
  - cidr: 10.128.0.0/14
    hostPrefix: 23
  machineNetwork:
  - cidr: 10.0.0.0/16
  serviceNetwork:
  - 172.30.0.0/16
platform:
  aws:
    region: ${AWS_REGION}
    defaultMachinePlatform:
      type: ${EC2_TYPE}
publish: External
pullSecret: '${OPENSHIFT_PULL_SECRET}'
sshKey: '${SSH_PUBLIC_KEY}'
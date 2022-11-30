# ansible-assisted-installer-ipxe

This Ansible repo is used to create clusters via assisted-installer API and extract all required files to a working directory. The current project can work with SaaS API or local deployment.

The default  cluster is set to `multi architecture" which will create two different PXE configurations ( x86 and arm64 ).


## The Setup
Default working directory is `<CURRENTDIR>/workdir` you can set a different one using the `WORKDIR` variable.

---

## Configurations

###  **mandatory Variable**

create your own var file, or copy the `vars-sample.yaml` file and setup the following values

```bash
### OCM token to create API KEY
### can be created at https://console.redhat.com/openshift/token
TOKEN: ""

### (Mandatory) set PullSecret created for Redhat
### can be downloaded from: "https://console.redhat.com/openshift/install/pull-secret"
### note this file should be located on the localhost and NOT the remote node 
PULL_SECRET_FILE: ""


### HTTP server IPXE for ipxe script
HTTP_SERVER_IP: "192.168.122.1"


### setup host IP range and prefix
HOST_NET_ADDRESS: "192.168.122.0"
HOST_PREFIX: "24"
```

> optional: you can customize your installation in the `vars-sample.yaml` which contains all available configuration and default values. 




### Running playbook
```bash
HOSTNAME='localhost'
VARFILE='my-varfile.yaml'
ansible-playbook -i $HOSTNAME, playbook.yaml --extra-vars @$VARFILE
```

> note: the `IPXE` script created is an example, please review it and change it to fit your environment 

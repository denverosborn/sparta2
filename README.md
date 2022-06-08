# sparta2
Once the sparta-utiltiy.tar.gz and the ocp-images.tar have been moved to the airgapped box they will need to be unpacked and utility container

## Prerequisites
- RHEL 8 base image
- Podman

### Unpack tar files
Step 1: `sudo mkdir -p /root/utility`

Step 2: `sudo tar xvf sparta-utility.tar.gz -C /root/utility`

Step 3: This script creates an SSH keypair and adds the public to the `authorized_keys` file of the host.

`cd /root/utility/sparta2 && bash ssh-keys.sh`

Step 4: load the utility container onto the localhost

`sudo podman load -i /root/utility/tar-bundles/utility.tar`

Step 5:
## site.yml

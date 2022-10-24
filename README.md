# djet-ansible-deploy

## Setup

NOTE: This is assuming you have Vagrant installed already, or you have a server with networking set up. 

The goal of this script is to quickly install NGINX, PHP8, MySQL8, and Memcached on Ubuntu 20.04 LTS.


### Local setup

1. Create a projects dir locally
2. Clone this project in it

### Vagrant setup

WARNING: These steps probably don't work anymore... I need to rewrite the vagrant side of this setup flow.  

1. Copy Vagrant file template or roll your own

   https://github.com/sanakhet/djet-conf/blob/master/vagrant/Vagrantfile

2. Update the variables at the top of the Vagrantfile
   ```shell
   LOCAL_PROJECT_PATH = "C:\\path\\to\\Projects"
   DEV_VM_HOSTNAME = YourHostName
   ```

3. Bring up vagrant and connect to it
   ```shell
   vagrant up
   vagrant ssh
   ```   


### Stand-alone server setup

Follow these steps when using a stand alone server, such as a RPi, Intel NUC, or whatever other mini PC.

1. Set up the default user
   ```shell
   sudo adduser djet
   sudo usermod -a -G sudo djet
   ```
2. Switch to the default user
   ```shell
   su djet
   ```

4. Install the required packages
   ```shell
   sudo apt install --yes cifs-utils git python3
   ```

5. Mount your projects dir
   - Replace `LOCAL_PRIVATE_IP` with your local machine private ip
   - Replace `LOCAL_USERNAME` with your local machine user name
   ```shell
   mkdir ~/dev
   sudo mount -t cifs //LOCAL_PRIVATE_IP/path/to/projects ~/dev -o username=LOCAL_USERNAME
   ```

### Services setup

1. Run setup script to add & install ansible then deploy

    - `cd ~/dev/djet-ansible-deploy`
    - `sudo ./install.sh`

2. Bring up/down services as required

   - `sudo systemctl start nginx`
   - `sudo systemctl start mysql`
   - `sudo systemctl start php8-fpm`
   - `sudo systemctl start memcached`
   
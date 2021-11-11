# djet-ansible-deploy

## Setup

NOTE: This is assuming you have Vagrant installed already.

The goal of this script is to quickly install NGINX, PHP8, MySQL8, and Memcached on Ubuntu 20.04 LTS.


### Local setup

1. Create a projects dir locally
2. Clone this project in it

### Vagrant setup

1. Copy Vagrant file template or roll your own

   https://github.com/sanakhet/djet-conf/blob/master/vagrant/Vagrantfile

2. Update the variables at the top of the Vagrantfile
 
    - LOCAL_PROJECT_PATH = "C:\\path\\to\\Projects"
    - DEV_VM_HOSTNAME = YourHostName

3. Bring up vagrant and connect to it
   
    - `vagrant up`
    - `vagrant ssh`
    
### Services setup

1. Run setup script to add & install ansible then deploy

    - `cd ~/dev/djet-ansible-deploy`
    - `sudo ./setup.sh`

2. Bring up/down services as required

   - `sudo systemctl start nginx`
   - `sudo systemctl start mysql`
   - `sudo systemctl start php-fpm`
   - `sudo systemctl start memcached`
   
os-db-evedump
-------------

Because sometimes, "Spreadsheets in Space" get dull, and needs
to be spiced up a bit.

This Rube Goldberg machine, uses a Vagrant VM. The Vagrant VM 
is prepared with two Ansible playbooks which can be used to.

**sync-evedump.yml**

The first playbook can be used to build an OpenStack cloud db 
if one is not found, then load the latest Eve Online MySQL 
static data dump (commonly known as an "evedump").  

A temporary cloud compute instance is created within the same
region and used to retrieve the latest evedump and then to 
load the db. This instance is destroyed at the end of the run.

If the VM contains a sentinel file from a previous run, then
the playbook will attempt to only load data if that data is
older than the latest evedump.

**destroy-db.yml**

Destroys your cloud db.

dependencies
------------

You must have access to an OpenStack cloud that features a 
Trove compatible API which supports a mariadb engine, and a 
Nova compatible API. You must have an openrc file for that
cloud.

An example openrc file is provided in the examples directory.

You must have VirtualBox and Vagrant installed if you want
to use the Vagrant VM as the deploy host. 

Alternatively you can probably just use any system you like 
as a deploy host if it has Ansible, Nova client, and Trove 
client installed. Some assembly required.

usage
-----

1. place a valid openrc in this repository's parent directory.

2. `vagrant up && vagrant ssh`

3. `ansible-playbook playbooks/sync-evedump.yml -e db_password=some_secret`


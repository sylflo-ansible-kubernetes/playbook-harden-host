# Ansible playbook to harden an host

This playbook aims to harden a host using multiple roles to satisfy this need

## Dependencies

This playbook requires those different roles.

- Copy a script to update host automatically every day at 2AM: tasks/cron_update.yml see (cf <https://matjaz.it/automatically-update-a-debian-ubuntu-using-apt-get-and-cron/>)
- install sudo: `weareinteractive.sudo`
- role compliants with DevSec Linux Baseline to harden the host: `dev-sec.os-hardening`
- role to harden ssh config: `dev-sec.ssh-hardening`
- install fail2ban: `oefenweb.fail2ban`
- install rkhunter: `https://github.com/icyd/rkhunter-ansible-role/commits/master`
- logwatch: `robertdebock.logwatch`
- portsentry `maxlareo.portsentry`

There is also a post_tasks to create a user of your choice and add it to the sudo group

To install the roles use this command:
`ansible-galaxy install -r  requirements.yml`

## Variables

Username (`username`) and password (`password`) of the user you wish to add to the system and sudo group.
Email address (`email`) to which to send logs

Create a file `site.yml` with the variables

```yml
- hosts: all
- name: Playbook to harden the host
  import_playbook: hardening/site.yml
  vars:
    hostlist: all
    username: yourUsername
    password: yourPassword
    email: yourEmail
```

## How to launch it

Once you installed the dependencies and create the `site.yml`, you just need to launch the playbook like so `ansible-playbook -i yourInventoryFile -K -u root site.yml`.

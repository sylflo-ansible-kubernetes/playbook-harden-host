# Ansible playbook to harden an host

This playbook aims to harden a host using multiple roles to satisfy this need

## Dependencies

This playbook requires those different roles.

- Copy a script to update host automatically every day at 2AM: tasks/cron_update.yml see (cf <https://matjaz.it/automatically-update-a-debian-ubuntu-using-apt-get-and-cron/>)
- role compliants with DevSec Linux Baseline to harden the host: `dev-sec.os-hardening`
- install fail2ban: `oefenweb.fail2ban`
- install rkhunter: `https://github.com/icyd/rkhunter-ansible-role/commits/master`
- logwatch: `robertdebock.logwatch`
- portsentry `maxlareo.portsentry`

To install the roles use this command:
`ansible-galaxy install -r  requirements.yml`

## Variables

Username (`ansible_ssh_user`) and password (`ansible_ssh_pass`) of the user you use to connect using ssh.
Email address (`email`) to which to send logs

Create a file `site.yml` with the variables

```yml
- hosts: all
  vars:
    ansible_ssh_user: debian
    ansible_ssh_pass: yourPassword
- name: Playbook to harden the host
  import_playbook: hardening/site.yml
  vars:
    hostlist: all
    username: debian
    password: yourPassword
    email: yourEmail@gmail.com
    install_fail2ban: false
    install_rkhunter: false
    install_logwatch: false
    install_portsentry: false
    install_automatic_update: true
```

## How to launch it

Once you installed the dependencies and create the `site.yml`, you just need to launch the playbook like so `ansible-playbook -i yourInventoryFile -K -u root site.yml`.

BackupNinja
=========

This role includes the grnet source.list and get the grnet gpg-key for apt. 
It then installs kamaki package and copies `.kamakirc` file to remote host,
this file includes the needed token for connecting to ~okeanos dashboard.

Requirements
------------

Debian supported only.

Example Playbook
----------------


- hosts: clients
  become: true

  roles:
    - kamaki

License
-------

MIT

Author Information
------------------

https://infra.ellak.gr (`infra@ellak.gr`)

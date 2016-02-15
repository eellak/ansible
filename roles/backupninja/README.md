Role Name
=========

This role will configure the clients to be backed up
using backupninja. SSH-keys and GPG-keys passphrases will
be printed to stdout. The role also fetches a backup of
the clients .gnupg directories to /tmp/bkup_gpg_keys/. 

It would be wise to keep the gpg passphrases and a copy
of the bkup_gpg_keys directory somewhere safe.

Requirements
------------

Debian supported only.

Example Playbook
----------------


- hosts: clients
  become: true

  roles:
    - backupninja

License
-------

MIT

Author Information
------------------

https://infra.ellak.gr (`infra@ellak.gr`)

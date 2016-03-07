~Okeanos post-install configuration
=========

This role will configure VMs for ELL/LAK's infastructure.

Requirements
------------

Created for ~Okeanos VM's only.

Example Playbook
----------------


- hosts: okeanos
  become: true

  roles:
    - okeanos_init

License
-------

MIT

Author Information
------------------

https://infra.ellak.gr (`infra@ellak.gr`)

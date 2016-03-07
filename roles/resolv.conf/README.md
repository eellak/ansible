Resolv.conf
=========

This role will configure a static resolv.conf file to work with ELL/LAK's 
systems. It will lock the file with an immutable flag.


Example Playbook
----------------


- hosts: all
  become: true

  roles:
    - resolv.conf

License
-------

MIT

Author Information
------------------

https://infra.ellak.gr (`infra@ellak.gr`)

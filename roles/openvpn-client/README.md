ansible.openvpn-client
=========

Along with Ellak's ansible.openvpn role this will push configuration files and
certificates to the appropriate clients, install openvpn and restart the service.

Requirements
------------

Debian tested only.
Ellak's ansible.openvpn.

Example Playbook
----------------


- hosts: vpn-clients
  become: true

  vars:
    - openvpn_dns: no

  roles:
    - openvpn-client

  tags:
    - clients

License
-------

MIT

Author Information
------------------

https://infra.ellak.gr (`infra@ellak.gr`)

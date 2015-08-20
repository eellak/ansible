php-fpm
=========

Install php-fpm.

Requirements
------------

Currently works only on Debian based systems.

Role Variables
--------------

Set `fqdn` in `vars/main.yml` for specific fpm pool config.

Dependencies
------------

php is needed.

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: php-fpm }

License
-------

MIT

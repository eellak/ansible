## MariaDB setup on CentOS7

The [secure_installation task](tasks/secure-installation.yml) checks if there
is a `/root/.my.cnf` file containing the root credentials needed to perform
mysql actions.

If not, guessing it's the first time mariadb runs, it updates
the root password (which is empty on new installations) with the variable
`mysql_root_password` in `defaults/main.yml`. It then copies the
[`.my.cnf` template](templates/dot_my.cnf.j2) in `/root/.my.cnf` for
subsequent runs.

If you already have changed the root password but don't have a `.my.cnf` file,
run the playbook with `--tags=mycnf` which will only copy the template.
Then, the secure_installation task will be idempotent.

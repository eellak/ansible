# Ansible for EELLAK Infra tasks

## Setup

### Protected secrets

1. Setup the following env var in your `.{bash,zsh}rc` file:

```
export ELLAK_ANSIBLE_SECRETS="/path/to/ansible-secrets"
```

## Playbooks

### upgrade.yml

Upgrade όλα τα μηχανήματα:

```
ansible-playbook targets playbooks/upgrade.yml -s -K
```

Εφ' όσον έχουμε πρόσβαση στα μηχανήματα θα μας ζητηθεί ο sudo κωδικός.

## TODOs

* Document how `host_vars` works with `protected_secret`.

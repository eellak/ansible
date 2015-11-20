# Ansible for EELLAK Infra tasks

## Setup

### Protected secrets

1. Setup the following env var in your `.{bash,zsh}rc` file:

```
export ELLAK_ANSIBLE_SECRETS="/path/to/ansible-secrets"
```

## Playbooks

Μέσα στο φάκελο `playbooks/` βρίσκονται τα ξεχωριστά playbooks που τρέχουν για
κάθε host και μερικά για κάποιες συγκεκριμένες διεργασίες, πχ το μηνιαίο
newsletter.

Υπάρχουν σχόλια εκεί που χρειάζεται.

## Upgrade.yml

Προς το παρόν μόνο Debian/Ubuntu συστήματα υποστηρίζονται. Ο κάθε server
χρειάζεται να έχει εγκατεστημένα τα:

```
python
python-apt
aptitude
sudo
```

Θα πρέπει επίσης να υπάρχει χρήστης ο οποίος να έχει passwordless sudo,
διαφορετικά το playbook θα πρέπει να γίνει invoke με το `-K` flag.

Παράδειγμα update όλων των μηχανημάτων που είναι στο `debian` group:

```
ansible-playbook playbooks/upgrade.yml -e "host=debian"
```

## Add new host

Για την προσθήκη ενός host στο internal δίκτυο του οκεανού, πρέπει να γίνουν 3
αλλαγές.

1. Προσθήκη host στο αρχείο `hosts`
2. Προσθήκη host στο `dnsmasq.conf` ώστε να γίνει assign στατική private IP
3. Προσθήκη του postinstall role στο playbook του host ώστε να σεταριστεί το
    `resolv.conf` με τα στοιχεία του internal DHCP (dnsmasq)
1. Δημιουργία αρχείου `host_vars/name.ellak.gr` με περιεχόμενα:
    ```
    fqdn: name.ellak.gr
    hostname: name.ellak.gr
    ```

## TODOs

* Document how `host_vars` works with `protected_secret`.

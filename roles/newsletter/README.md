# Newsletter

This role creates the monthly ellak and maellak newsletters.

## How to use

### ellak

Τροποποίηση σε 3 αρχεία:

- `vars/ellak_links.yml` με το περιεχόμενο του newsletter
- `vars/main.yml` αλλαγή της μεταβλητής `ellak_latest` με τη νεότερη ημερομηνία
- `files/newsletter_index.html` προσθήκη νέου link με το νέο newsletter κάτω από
    τη γραμμή 288

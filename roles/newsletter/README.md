# Newsletter

This role creates the monthly ellak and maellak newsletters.

## How to use

Το περιεχόμενο του newsletter βασίζεται εξ' ολοκλήρου σε variables και
templates.

Βήματα:

1. Αλλαγή του `vars/ellak_links.yml` με τα νέα links.
1. Στο `vars/main.yml` αλλαγή της μεταβλητής `ellak_latest` με τη νεότερη ημερομηνία.
1. Στο `files/newsletter_index.html` προσθήκη νέου link με το νέο newsletter κάτω από τη γραμμή 288.

Αν κάποιο θέμα δεν έχει links αντί για άγκιστρα με περιεχόμενο, βάζουμε
δύο αγκύλες, πχ.

```
odi: []
```

Με αυτόν τον τρόπο, δε θα εμφανιστεί στην αριστερή στήλη του newsletter κάποια
επικεφαλίδα που δεν έχει links.

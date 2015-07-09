# SSL certificates

Copy to location `/etc/ssl/ellak/` the following certificates:

| certificate | contains |
| ----------- | -------- |
| ellak.gr.key | το private SSL key |
| ellak.gr.crt | signed public key from CA |
| ellak.gr.ca-bundle | το public key του CA |
| ellak.gr-bundle.crt | τα 2 προηγούμενα concatenated με τη σειρά που εμφανίζονται |
| ellak.gr.csr | Certificate Signing Request |

## Web server configuration

Παρακάτω είναι το configuration block που πρέπει να υπάρχει στον nginx/apache.
Χρήσιμα sites:

* https://mozilla.github.io/server-side-tls/ssl-config-generator/
* https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html
* https://raymii.org/s/tutorials/Strong_SSL_Security_On_Apache2.html
* https://cipherli.st/

### Nginx

```
ssl_certificate     /etc/ssl/ellak/ssl.crt;
ssl_certificate_key /etc/ssl/ellak/ssl.key;
ssl_session_timeout 1d;
ssl_session_cache   shared:SSL:50m;

# Diffie-Hellman parameter for DHE ciphersuites, recommended 2048 bits
# Generate with:
#   openssl dhparam -outform pem -out /etc/ssl/ellak/dhparam2048.pem 2048
ssl_dhparam /etc/ssl/ellak/dhparam2048.pem;

# modern configuration. tweak to your needs.
ssl_protocols TLSv1.1 TLSv1.2;
ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK';
ssl_prefer_server_ciphers on;

# HSTS (ngx_http_headers_module is required) (15768000 seconds = 6 months)
add_header Strict-Transport-Security max-age=15768000;
```

### Apache

```
SSLEngine on
SSLCertificateFile      "/etc/ssl/ellak/ssl.crt"
SSLCertificateKeyFile   "/etc/ssl/ellak/ssl.key"
SSLProtocol             all -SSLv2 -SSLv3
SSLCipherSuite          ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA
SSLHonorCipherOrder     on
```

## Test configuration

* https://www.ssllabs.com/ssltest/
* https://ssldecoder.org/
* https://www.sslshopper.com/ssl-checker.html

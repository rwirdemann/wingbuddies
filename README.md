# Wingbuddies.de

## Deployment

### Apache configuration

```
sudo vi /etc/apache2/sites-enabled/wingbuddies.conf

<VirtualHost *:80>
  ServerName http://wingbuddies.de
  DocumentRoot /var/apps/clock/public

  <Location />
    Require all granted
  </Location>

  RewriteEngine on
  RewriteRule ^/?$ /index.html
  RewriteCond %{DOCUMENT_ROOT}/%{REQUEST_FILENAME} !-f
  RewriteRule ^/(.*)$ http://127.0.0.1:8080%{REQUEST_URI} [P,QSA,L]
</VirtualHost>
```

### Start Puma locally

```
./restart.sh
```
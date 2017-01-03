# quizapi
A simple API for multiple choice questions.

## Install

1.Clone or download in a folder

2.Import questions.sql to your DB. The import contains some questions to get you started.

3.Configure your server conf or add this to .htaccess:
```
<IfModule mod_rewrite.c>
Options +FollowSymLinks
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^/api/(.*)$ /mAPI.class.php?r=$1 [L,QSA]
</IfModule>
```
## Usage
Create a new collection of questions from specific category(optional) ```/api/new/[category]```

Get a single question from the collection from category(optional) ```/api/questions/[collection_id]/[category]```

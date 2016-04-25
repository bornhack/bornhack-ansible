hosts={{ postgres_host }}
user={{ postgres_user }}
password={{ postgres_password }}
dbname={{ postgres_dbname }}
query=SELECT email as username, '/use/dovecot/deliver/please' AS home FROM users WHERE lower(localpart||'@'||domain) = lower('%s')

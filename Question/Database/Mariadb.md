# Mariadb

## Mariadb import error 1118
```bash
# Add innodb_strict_mode = 0 in /etc/my.cnf or /etc/my.cnf.d/mariadb-server.cnf
vim /etc/my.cnf
innodb_strict_mode             = 0

```
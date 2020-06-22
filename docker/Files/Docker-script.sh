#!/bin/bash 
chown -R apache /Sites/online_test
chown -R apache /Sites/online_test/yaksh
chown -R nobody /Sites/online_test/yaksh_data
chmod -R 664 /Sites/online_test
chmod -R +X /Sites
python3 manage.py migrate --noinput
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin','admin@example.com','admin')"|python3 manage.py shell
python3 manage.py collectstatic --noinput
/usr/sbin/httpd -D FOREGROUND

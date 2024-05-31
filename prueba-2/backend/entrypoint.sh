#!/bin/sh

# wait for Postgres container to be ready
while ! echo exit | nc $SQL_HOST $SQL_PORT; do
  echo "Waiting for database to be ready..."
  sleep 1
done

echo "Database is ready, proceeding with Django commands."

# Uncomment below to flush db e.g. after running tests
# Just make sure you really mean it 
# python manage.py flush --no-input

# We have base custom user model so need to makemigrations out of box

python manage.py makemigrations
python manage.py flush --no-input
python manage.py migrate
python manage.py loaddata initial_data.json

# Create superuser
echo "Creating superuser..."
python manage.py shell <<EOF
from django.contrib.auth import get_user_model

User = get_user_model()
username = '$SUPERUSER_USERNAME'
email = '$SUPERUSER_EMAIL'
password = '$SUPERUSER_PASSWORD'

if not User.objects.filter(username=username).exists():
    User.objects.create_superuser(username=username, email=email, password=password)
    print(f"Superuser {username} created successfully!")
else:
    print(f"Superuser {username} already exists.")
EOF

echo "Starting Django server..."


# python manage.py collectstatic --noinput
python manage.py runserver 0.0.0.0:8000



exec "$@"
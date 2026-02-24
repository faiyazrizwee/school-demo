#!/bin/bash

echo "Starting Django application..."

# Run migrations
python manage.py migrate --noinput

# Collect static files
python manage.py collectstatic --noinput

# Start gunicorn
gunicorn school_project.wsgi:application \
    --bind 0.0.0.0:${PORT:-8000} \
    --workers 4 \
    --threads 2 \
    --timeout 120 \
    --access-logfile - \
    --error-logfile -

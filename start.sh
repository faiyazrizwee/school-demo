#!/bin/bash

# Apply database migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Start the application with gunicorn
gunicorn school_project.wsgi:application --bind 0.0.0.0:$PORT --workers 4

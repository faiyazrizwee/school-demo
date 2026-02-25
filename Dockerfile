# Use official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PORT=8000

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install pip (though it comes with Python image)
RUN python -m ensurepip --upgrade

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Collect static files
RUN python manage.py collectstatic --noinput

# Run migrations (will run on every start too)
RUN python manage.py migrate --noinput

# Create start script
RUN echo '#!/bin/bash\n\
echo "Starting Django application..."\n\
python manage.py migrate --noinput\n\
gunicorn school_project.wsgi:application \
    --bind 0.0.0.0:$PORT \
    --workers 4 \
    --threads 2 \
    --timeout 120 \
    --access-logfile - \
    --error-logfile -' > /app/start.sh && chmod +x /app/start.sh

# Expose port
EXPOSE $PORT

# Start the application
CMD ["/app/start.sh"]

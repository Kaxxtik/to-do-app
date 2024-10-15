# Use a base image with a more stable version of Python
FROM python:3.9

# Set the working directory
WORKDIR /data

# Install the required system packages
RUN apt-get update && apt-get install -y \
    python3-distutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Django
RUN pip install django==3.2

# Copy project files into the container
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose the port (optional, modify if necessary)
EXPOSE 8000

# Command to run the application (modify as needed)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Container image that runs code
FROM python:3.12.0-alpine3.18

# Update environment
RUN apk -U update

# Copies code file from your action repository to the filesystem path `/` of the container
COPY . .

# Download the necessary libraries
RUN pip install -r requirements.txt

# Run app with gunicorn
ENTRYPOINT  ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

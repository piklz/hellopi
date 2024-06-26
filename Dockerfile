# Base image
#FROM alpine
FROM python:alpine

# Set working directory
WORKDIR /hellopi

# Install psutil for system information (CPU temperature, etc.)
# This might require additional libraries depending on your specific needs
RUN apk add --no-cache py3-psutil

# Copy application files
COPY hellopi.sh .
# Copy the Python script to the container
COPY hellopi.py .

#permissions
RUN chmod +x /hellopi/hellopi.py

#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

# Run the Python script as the entrypoint
CMD ["python", "hellopi.py"]
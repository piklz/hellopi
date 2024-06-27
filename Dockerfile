# Base image
#FROM alpine
FROM python:alpine

# Set working directory

RUN mkdir /hellopi
WORKDIR /hellopi


# Copy application files
COPY hellopi.sh .
# Copy the Python script to the container
COPY hellopi.py .

#permissions
RUN chmod +x /hellopi/hellopi.py

# Create a directory within the container
RUN mkdir -p /volume/hellopi

#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

# Run the Python script as the entrypoint
CMD ["python", "hellopi.py"]
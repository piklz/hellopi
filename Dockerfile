# Base image
#FROM alpine
FROM python:alpine

# Set working directory

RUN mkdir /volume
WORKDIR /volume


# Copy application files
COPY hellopi.sh .
# Copy the Python script to the container
COPY hellopi.py .

#permissions
RUN chmod +x /volume/hellopi.py

# Create a directory within the container
RUN mkdir -p /volume/hellopi/
COPY hellopi.py .

#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

# Run the Python script as the entrypoint
CMD ["python", "hellopi.py"]
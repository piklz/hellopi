# Base image
FROM alpine

# Set working directory
WORKDIR /hellopi

# Copy application files
COPY hellopi.sh .

RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

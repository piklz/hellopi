# Base image
#FROM alpine
FROM python:alpine AS BUILD_IMAGE

# Set working directory
WORKDIR /app


# Copy application files
COPY hellopi.sh .
# Copy the Python script to the container
COPY hellopi.py .

#permissions
RUN chmod +x hellopi.py



COPY hellopi.sh hellopi.py /app  # Copy 


#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

# Run the Python script as the entrypoint
CMD ["python", "hellopi.py"]
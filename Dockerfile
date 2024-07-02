# Base image
#FROM alpine
FROM python:3-alpine

# Set working directory
WORKDIR /app

COPY hellopi.sh hellopi.py /app  # Copy 

#permissions
RUN chmod +x hellopi.py






#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

# Run the Python script as the entrypoint
CMD ["python", "hellopi.py"]
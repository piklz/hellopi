# Base image
#FROM alpine
FROM python:3-alpine

# Set working directory
WORKDIR /app


# copy 
COPY . .

# permissions
RUN chmod +x hellopi.py
RUN chmod +x hellopi.sh


#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

# Run the Python script as the entrypoint
CMD ["python", "/app/hellopi.py"]
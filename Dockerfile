# Base image
#FROM alpine
FROM python:3-alpine

LABEL maintainer piklz


# Set working directory
WORKDIR /app


# copy 
COPY . .

# permissions
RUN chmod +x hellopi.py
RUN chmod +x hellopi.sh
RUN chmod +x entrypoint.sh

# Use the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

#VOLUME /app
#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

# Run the Python script as the entrypoint
#CMD ["python", "main.py"]
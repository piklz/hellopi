# Base image
#FROM alpine
FROM python:3-alpine

LABEL maintainer piklz

RUN mkdir /app
# Set working directory
WORKDIR /app


# copy 
COPY . ./app

# permissions
RUN chmod +x hellopi.py
RUN chmod +x hellopi.sh
RUN chmod +x entrypoint.sh
RUN chmod +x main.py

# Use the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

#VOLUME /app
#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

# Run the Python script as the entrypoint
#CMD ["python", "main.py"]
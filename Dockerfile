# Base image
#FROM alpine
FROM python:3-alpine

# Set working directory
WORKDIR /src

# permissions
RUN chmod +x hellopi.py

# copy 
COPY hellopi.sh hellopi.py /src  





#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

# Run the Python script as the entrypoint
CMD ["python", "hellopi.py"]
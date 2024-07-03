# Base image
FROM python:3-alpine


LABEL maintainer="piklz"


# Set working directory
#WORKDIR /ap

# copy 
COPY . .

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
# Base image
FROM python:3-alpine

ENV XDG_DATA_HOME="/config" \
XDG_CONFIG_HOME="/config"
mkdir -p \
    /app/Hellopi
# make sure all messages always reach console
ENV PYTHONUNBUFFERED=1

chown -R root:root /app/Hellopi

WORKDIR /app
COPY . .

# permissions
RUN chmod +x main.py



#VOLUME /app
#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

VOLUME /config

# Run the Python script as the entrypoint
CMD ["python", "main.py"]
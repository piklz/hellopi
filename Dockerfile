# Base image
FROM python:3-alpine

ENV XDG_DATA_HOME="/config" \
XDG_CONFIG_HOME="/config"

RUN \
    echo "**** install packages ****" && \
    apk --no-cache add \
        icu-data-full \
        icu-libs && \
    echo "**** mkdir hellopi ****" && \    
    mkdir -p \
        /app/Hellopi && \
        chown -R root:root /app/Hellopi

# make sure all messages always reach console
ENV PYTHONUNBUFFERED=1

COPY . .

# permissions
RUN chmod +x main.py



#VOLUME /app
#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

VOLUME /config

# Run the Python script as the entrypoint
CMD ["python", "main.py"]
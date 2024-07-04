# Base image
FROM python:3-alpine

# make sure all messages always reach console
ENV PYTHONUNBUFFERED=1


WORKDIR /app
COPY . .

# permissions
RUN chmod +x main.py



#VOLUME /app
#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

VOLUME /config

# Run the Python script as the entrypoint
CMD ["python", "main.py"]
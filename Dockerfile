# Base image
FROM python:3-alpine


RUN mkdir /home/pi/app
WORKDIR /home/pi/app
COPY . .



# permissions
RUN chmod +x hellopi.py
RUN chmod +x hellopi.sh
RUN chmod +x entrypoint.sh
RUN chmod +x main.py

# make sure all messages always reach console
ENV PYTHONUNBUFFERED=1

# Use the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

#VOLUME /app
#RUN echo "Hello, World! Docker hellopi is working " > /hellopitest.txt

# Run the Python script as the entrypoint
#CMD ["python", "main.py"]
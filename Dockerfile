#FROM python:3.9.7-slim-buster
FROM python:3.10.8-slim-buster

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
COPY . /app/
WORKDIR /app/
RUN pip3 install --upgrade -r Installer

#CMD ["python3", "modules/main.py"]
CMD gunicorn app:app & python3 aj/main.py

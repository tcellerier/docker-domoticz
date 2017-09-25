
FROM debian:stretch

LABEL com.example.version="1.0.0" \
      com.example.release-date="2017-09-25"


########## Installation ##########

## Paquets linux
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    libusb-dev \
    vim \
    procps

## Python pré-requis
RUN apt-get update && apt-get install -y tcpdump python-pip python3 python3-dev && \
    pip install scapy && \
    pip install pyarlo

## Homebridge pré-requis
RUN apt-get update && apt-get install -y libavahi-compat-libdnssd-dev && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g homebridge

## Création user pi, mot de passe : raspberry
RUN useradd -m pi && \
     echo "pi:raspberry" | chpasswd && adduser pi sudo

## Ajout du script de démarrage
COPY files/start.sh /home/pi/start.sh
RUN chown pi /home/pi/start.sh && chmod u+x /home/pi/start.sh 

USER pi
WORKDIR /home/pi/

## Exécution du script de démarrage du container 
CMD /bin/sh -c /home/pi/start.sh && /bin/bash

## Ouverture des ports
EXPOSE 8080

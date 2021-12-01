FROM ubuntu:18.04

# Copy everything from the current directory into the container
WORKDIR /app
COPY . .

# Upgrade & install packages
RUN apt-get update && apt-get install -y \
    curl \
    netcat \
    sudo \
    gettext-base \
    tor \
    tor-geoipdb

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

# Run bash file tor.sh
USER docker
EXPOSE 9050

CMD /bin/bash tor.sh & /bin/bash new_circuit.sh
FROM ubuntu:18.04

WORKDIR /app
# Copy everything from the current directory into the container
COPY . .

# Upgrade & install packages
RUN apt-get update && apt-get install -y \
    curl \
    netcat \
    sudo \
    tor \
    watch \
    gettext-base \
    tor-geoipdb

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

# Run bash file tor.sh
USER docker
CMD ["/bin/bash", "tor.sh"]

EXPOSE 9050
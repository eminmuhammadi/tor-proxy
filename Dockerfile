FROM alpine

WORKDIR /app
# Copy everything from the current directory into the container
COPY . .

# Upgrade & install packages
RUN apk --no-cache --no-progress upgrade \
    apk --no-cache --no-progress add bash curl nc echo pidof kill envsubst tor tor-geoipdb

EXPOSE 9050 9051

# Run bash file tor.sh
CMD ["/bin/bash", "/tor.sh"]
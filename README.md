# Tor Proxy

## Dependencies
- nc
- echo
- pidof
- kill
- curl
- envsubst

Required:
- tor
- tor-geoipdb


## Start
```bash
bash tor.sh
```

## Kill
```bash
bash kill.sh
```

## Run via docker-compose
```bash
docker-compose up -d --build
```
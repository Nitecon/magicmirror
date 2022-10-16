FROM node:latest
RUN apt update -y && apt install -y ca-certificates git

# Mount the modules you check out under /data/mm/modules
# Mount your config for magic mirror under /data/mm/config

RUN mkdir -p /data/mm && \
    cd /data && git clone -q https://github.com/MichMich/MagicMirror && \
    cd /data/MagicMirror && \
    npm run install-mm && \
    npm install ical-expander

ADD entrypoint.sh /entrypoint.sh

WORKDIR /data/MagicMirror

EXPOSE 8080

ENTRYPOINT ["sh","/entrypoint.sh"]


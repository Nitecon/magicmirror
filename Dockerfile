FROM node:latest
RUN apt update -y && apt install -y ca-certificates git

# Mount the modules you check out under /data/mm/modules
# Mount your config for magic mirror under /data/mm/config

RUN mkdir -p /data/mm/modules && mkdir -p /data/mm/config && \
    cd /data && git clone -q https://github.com/MichMich/MagicMirror && \
    cd /data/MagicMirror && \
    cp -f /data/MagicMirror/config/config.js.sample /data/mm/config/config.js && \
    npm run install-mm && \
    npm install --omit=dev ical-expander

ADD entrypoint.sh /entrypoint.sh

WORKDIR /data/MagicMirror

EXPOSE 8080

ENTRYPOINT ["sh","/entrypoint.sh"]


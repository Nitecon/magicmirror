FROM node:latest
RUN apt update -y && apt install -y ca-certificates git

RUN mkdir -p /data && \
    cd /data && git clone -q https://github.com/MichMich/MagicMirror && \
    cd /data/MagicMirror && \
    npm run install-mm

WORKDIR /data/MagicMirror

EXPOSE 8080

ENTRYPOINT ["npm", "run", "server"]

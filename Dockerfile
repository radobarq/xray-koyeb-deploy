FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y curl unzip

RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/xray.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/xray && \
    rm /tmp/xray.zip

COPY config.json /etc/xray/config.json

EXPOSE 8080

CMD ["/usr/local/bin/xray", "-config", "/etc/xray/config.json"]

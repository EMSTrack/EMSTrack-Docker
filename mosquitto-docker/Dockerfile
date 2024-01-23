FROM iegomez/mosquitto-go-auth

RUN set -ex; \
        apt install -y inotify-tools

RUN mkdir /mosquitto/var && chown -R mosquitto:mosquitto /mosquitto

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
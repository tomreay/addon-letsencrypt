RG BUILD_FROM
FROM $BUILD_FROM

# Setup base
RUN apk add --no-cache \
        openssl libffi musl libstdc++ \
    && apk add --no-cache --virtual .build-dependencies \
        g++ musl-dev openssl-dev libffi-dev python3 python3-dev \
    && python3 -m ensurepip \
    && pip3 install --no-cache-dir certbot certbot-dns-route53 \
    && pip3 install urllib3==1.24

# Copy data
COPY run.sh /

CMD [ "/run.sh" ]

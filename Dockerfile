FROM alpine:latest
RUN apk -Uuv add groff less python3 py3-pip jq
RUN pip install awscli
RUN apk --purge -v del py-pip && rm /var/cache/apk/*
RUN mkdir /aws && mkdir -p /root/.aws
WORKDIR /aws
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

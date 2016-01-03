# FROM ubuntu:latest

# RUN apt-get update && apt-get install -y privoxy

# EXPOSE 8118
# CMD ["privoxy", "--no-daemon", "/etc/privoxy/config"]


FROM alpine:latest


RUN apk update && apk add \
	privoxy \
	&& rm -rf /var/cache/apk/*

# expose http port
EXPOSE 8118

# copy in our privoxy config file
COPY privoxy.conf /etc/privoxy/config

# make sure files are owned by privoxy user
RUN chown -R privoxy /etc/privoxy

USER privoxy

ENTRYPOINT [ "privoxy", "--no-daemon" ]
CMD [ "/etc/privoxy/config" ]
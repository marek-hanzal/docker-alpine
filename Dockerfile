FROM alpine:3.11

ENV \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8" \
    NODE_ENV="production" \
    ZSH_THEME="agnoster"
    
RUN apk update
RUN apk add --no-cache \
        runit curl ca-certificates bash gettext re2c libaio zsh
RUN apk add --no-cache --virtual build-dependencies \
        py-pip gcc make python2-dev libffi-dev openssl-dev libc-dev tzdata \
        wget shadow unzip zip git nodejs npm
RUN pip install dumb-init
 RUN wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN cp /usr/share/zoneinfo/UTC /etc/localtime
WORKDIR /

ENTRYPOINT ["dumb-init", "--"]
CMD ["tail", "-f"]

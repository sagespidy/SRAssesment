FROM alpine:latest

RUN set -x \
    && apk add --update \
        curl\
        bash\
        alpine-sdk\
        nodejs-npm \
        xvfb \
        chromium \
        bzip2 \
        curl \
        python \
        python-dev \
        libressl-dev \
        libffi-dev \
        unzip \
        py-pip \
    && pip install ansible boto boto3 awscli \
    && rm -rf /var/cache/apk/*

ADD scripts/xvfb-chrome /usr/bin/xvfb-chrome
RUN ln -sf /usr/bin/xvfb-chrome /usr/bin/google-chrome \
    && npm install -g @angular/cli --unsafe-perm \
    && npm install -g istanbul \
    && npm install -g jasmine-node \
    && npm install -g jasmine-core@* \
    && npm install -g karma \
    && npm install -g karma-coverage-istanbul-reporter \
    && npm install -g karma-jasmine-html-reporter \
    && npm install -g karma-chrome-launcher \
    && npm install -g karma-jasmine \
    && npm install -g typescript

ENV CHROME_BIN /usr/bin/google-chrome

USER root

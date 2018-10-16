FROM nginx:1.15.5-alpine

ENV LANG C.UTF-8
ENV DOMAIN_NAME localhost

RUN apk update && apk upgrade && apk add --no-cache mysql-dev mysql-client libxml2 libxslt imagemagick openssh git less curl bash
RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo Asia/Tokyo > /etc/timezone

# Alpine Linux 3.3移行は不要
RUN rm -rf /var/cache/apk/*

# copy ssh key
#RUN mkdir /root/.ssh
#ADD config/.ssh/ /root/.ssh/
#RUN chmod -R 600 /root/.ssh/

RUN mkdir /app
WORKDIR /app

RUN apk add --no-cache --virtual alpine-sdk linux-headers libxml2-dev libxslt-dev imagemagick-dev

ADD . /app

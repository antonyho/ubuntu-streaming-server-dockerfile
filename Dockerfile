FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -y ffmpeg

RUN apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev
RUN apt-get install -y nginx

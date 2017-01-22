FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install ffmpeg

RUN apt-get install build-essential libpcre3 libpcre3-dev libssl-dev
RUN apt-get install nginx

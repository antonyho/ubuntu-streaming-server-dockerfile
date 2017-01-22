FROM ubuntu:xenial

RUN sudo apt-get update
RUN sudo apt-get install ffmpeg

RUN sudo apt-get install build-essential libpcre3 libpcre3-dev libssl-dev
RUN sudo apt-get install nginx

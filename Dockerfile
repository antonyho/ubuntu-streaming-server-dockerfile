FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -y ffmpeg

RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:malcscott/nginx-rtmp
RUN apt-get update
RUN apt-get install -y nginx

RUN service nginx stop

ADD nginx-rmtp-cfg-simple.txt /root/
ADD nginx-rmtp-cfg-save-video.txt /root/
RUN cat nginx-rmtp-cfg-simple.txt >> /etc/nginx/nginx.conf
ADD config-stream-arg-nginx.sh /root/

CMD ["/root/config-stream-arg-nginx.sh", twitch_address, twitch_stream_key, youtube_address, youtube_stream_key]

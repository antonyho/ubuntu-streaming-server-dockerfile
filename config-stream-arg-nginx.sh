#!/bin/bash

if [[ ! -z "$MIXER_ADDRESS" ]]; then
	sed -i "16i\\            push rtmp://$MIXER_ADDRESS/$MIXER_STREAM_KEY;" /root/nginx-rmtp-cfg-simple.txt
fi

if [[ ! -z "$FACEBOOK_ADDRESS" ]]; then
	sed -i "16i\\            push rtmp://$FACEBOOK_ADDRESS/$FACEBOOK_ADDRESS;" /root/nginx-rmtp-cfg-simple.txt
fi

if [[ ! -z "$TWITCH_ADDRESS" ]]; then
	sed -i "16i\\            push rtmp://$TWITCH_ADDRESS/$TWITCH_STREAM_KEY;" /root/nginx-rmtp-cfg-simple.txt
fi

if [[ ! -z "$YOUTUBE_ADDRESS" ]]; then
	sed -i "16i\\            push rtmp://$YOUTUBE_ADDRESS/$YOUTUBE_STREAM_KEY;" /root/nginx-rmtp-cfg-simple.txt
fi

cp /root/nginx-rmtp-cfg-simple.txt /etc/nginx/nginx.conf

nginx -g "daemon off;"

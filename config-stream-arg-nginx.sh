#!/bin/bash

if [[ ! -z "$RESTREAM_ADDRESS" ]]; then
	sed -i "15i\\            push rtmp://$RESTREAM_ADDRESS/$RESTREAM_STREAM_KEY;" /root/nginx-rmtp-cfg-simple.txt
fi

if [[ ! -z "$TWITCH_ADDRESS" ]]; then
	sed -i "15i\\            push rtmp://$TWITCH_ADDRESS/$TWITCH_STREAM_KEY;" /root/nginx-rmtp-cfg-simple.txt
fi

if [[ ! -z "$YOUTUBE_ADDRESS" ]]; then
	sed -i "15i\\            push rtmp://$YOUTUBE_ADDRESS/$YOUTUBE_STREAM_KEY;" /root/nginx-rmtp-cfg-simple.txt
fi

if [[ ! -z "$FACEBOOK_ADDRESS" ]]; then
	sed -i "15i\\            push rtmp://$FACEBOOK_ADDRESS/$FACEBOOK_ADDRESS;" /root/nginx-rmtp-cfg-simple.txt
fi

if [[ ! -z "$ODYSEE_ADDRESS" ]]; then
	sed -i "15i\\            push rtmp://$ODYSEE_ADDRESS/$ODYSEE_STREAM_KEY;" /root/nginx-rmtp-cfg-simple.txt
fi

cp /root/nginx-rmtp-cfg-simple.txt /etc/nginx/nginx.conf

nginx -g "daemon off;"

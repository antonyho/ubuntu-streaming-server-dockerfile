#!/bin/bash

if [[ ! -z "$MIXER_ADDRESS" ]]; then
	sed -i "10i\\            push rtmp://$MIXER_ADDRESS/$MIXER_STREAM_KEY;" /root/nginx-rmtp-cfg-simple.txt
fi

if [[ ! -z "$FACEBOOK_ADDRESS" ]]; then
	sed -i "10i\\            push rtmp://$FACEBOOK_ADDRESS/$FACEBOOK_ADDRESS;" /root/nginx-rmtp-cfg-simple.txt
#        awk -v FACEBOOK_ADDRESS="$FACEBOOK_ADDRESS" -v FACEBOOK_STREAM_KEY="$FACEBOOK_STREAM_KEY" 'NR == 11 {print; print "            push rtmp://FACEBOOK_ADDRESS/FACEBOOK_STREAM_KEY;"; next}1' /root/nginx-rmtp-cfg-simple.txt > /root/nginx-rmtp-cfg-simple.txt.new
#	mv /root/nginx-rmtp-cfg-simple.txt.new /root/nginx-rmtp-cfg-simple.txt

fi

if [[ ! -z "$TWITCH_ADDRESS" ]]; then
	sed -i "10i\\            push rtmp://$TWITCH_ADDRESS/$TWITCH_STREAM_KEY;" /root/nginx-rmtp-cfg-simple.txt
#	awk -v TWITCH_ADDRESS="$TWITCH_ADDRESS" -v TWITCH_STREAM_KEY="$TWITCH_STREAM_KEY" 'NR == 11 {print; print "            push rtmp://TWITCH_ADDRESS/TWITCH_STREAM_KEY;"; next}1' /root/nginx-rmtp-cfg-simple.txt > /root/nginx-rmtp-cfg-simple.txt.new
#	mv /root/nginx-rmtp-cfg-simple.txt.new /root/nginx-rmtp-cfg-simple.txt
fi

if [[ ! -z "$YOUTUBE_ADDRESS" ]]; then
	sed -i "10i\\            push rtmp://$YOUTUBE_ADDRESS/$YOUTUBE_STREAM_KEY;" /root/nginx-rmtp-cfg-simple.txt
 #       awk -v YOUTUBE_ADDRESS="$YOUTUBE_ADDRESS" -v YOUTUBE_STREAM_KEY="$YOUTUBE_STREAM_KEY" 'NR == 11 {print; print "            push rtmp://YOUTUBE_ADDRESS/YOUTUBE_STREAM_KEY;"; next}1' /root/nginx-rmtp-cfg-simple.txt > /root/nginx-rmtp-cfg-simple.txt.new
#	mv /root/nginx-rmtp-cfg-simple.txt.new /root/nginx-rmtp-cfg-simple.txt
fi

cp /root/nginx-rmtp-cfg-simple.txt /etc/nginx/nginx.conf

nginx -g daemon off;

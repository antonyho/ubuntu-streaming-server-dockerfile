#!/bin/bash

sed "s|TWITCH_ADDRESS|$TWITCH_ADDRESS|g" -i /etc/nginx/nginx.conf
sed "s|TWITCH_STREAM_KEY|$TWITCH_STREAM_KEY|g" -i /etc/nginx/nginx.conf
sed "s|YOUTUBE_ADDRESS|$YOUTUBE_ADDRESS|g" -i /etc/nginx/nginx.conf
sed "s|YOUTUBE_STREAM_KEY|$YOUTUBE_STREAM_KEY|g" -i /etc/nginx/nginx.conf

service nginx start

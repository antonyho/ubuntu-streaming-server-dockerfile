# ubuntu-streaming-server-dockerfile
Dockerfile for hosting streaming like Twitch and YouTube


This Docker image is based on the instructions in this [reddit thread](https://blog.manhim.net/2015/01/live-streaming-using-a-computer-and-a-ubuntu-server-to-twitch-tv/). And with reference to the installation guide in [this blog](https://blog.manhim.net/2015/01/live-streaming-using-a-computer-and-a-ubuntu-server-to-twitch-tv/)


##### nginx-rmtp-cfg-simple.txt
This file contains a really simple configuration to stream

On the OBS computer you record the game on, put `rtmp://192.168.1.x/live` as the stream server URL.

`192.168.1.x` is the IP of the nginx stream server IP in your local network.


##### nginx-rmtp-cfg-save-video.txt
This file contains an advanced configuration to stream with ffmpeg providing encoding parameters. And input will be recorded in 15 minutes time frame. You may modify it yourself to your need.

`record_interval 15m;` - record period interval.

`record_path /your/path;` - recorded video save path.

`STREAM_KEY` - the stream key which you set for yourself. You will have to use this key in your OBS computer.

`push rtmp://TWITCH_ADDRESS/TWITCH_STREAM_KEY;` - Twitch or YouTube link to stream to. The stream key is your account secret to stream your video to.

On the OBS computer you record the game on, put `rtmp://192.168.1.x/livein` as the stream server URL.

`192.168.1.x` is the IP of the nginx stream server IP in your local network.


##### Start the image
```
docker run --rm -p 1935:1935 \
-e TWITCH_ADDRESS='live.twitch.tv' \
-e TWITCH_STREAM_KEY='live_149239837_3w8rlsjdflaasdkfukw3hksldhjflkahsj' \
-e YOUTUBE_ADDRESS='a.rtmp.youtube.com/live2' \
-e YOUTUBE_STREAM_KEY='21s2-o23h-oso9-a64n' \
ubuntu-stream-server 
```

flask-video-streaming
=====================

Supporting code for my article [video streaming with Flask](http://blog.miguelgrinberg.com/post/video-streaming-with-flask) and its follow-up [Flask Video Streaming Revisited](http://blog.miguelgrinberg.com/post/flask-video-streaming-revisited).

To upload to Pi and build docker image and run container:

```
scp -r * rpi:~/Projects/flask-video-streaming/ && \
  ssh rpi "docker rm -f flask-video-streaming; docker system prune -f; docker build -t drnic/flask-video-streaming ~/Projects/flask-video-streaming/ && docker run -d --name flask-video-streaming --device=/dev/vcsm --device=/dev/vchiq -p 5000:5000 drnic/flask-video-streaming"
```

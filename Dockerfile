FROM drnic/rpi-docker-tensorflow

EXPOSE 5000
ENV PORT=5000
WORKDIR /app

RUN curl -s http://archive.raspbian.org/raspbian.public.key -o - | apt-key add - && \
    apt-key list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 82B129927FA3303E && \
    apt-key list && \
    echo "deb http://archive.raspberrypi.org/debian/ jessie main contrib non-free" | tee /etc/apt/sources.list.d/raspi.list && \
    apt-get update && apt-get install python-picamera -y && \
    pip install flask

ENV CAMERA=pi

COPY . /app

CMD ["python", "app.py"]

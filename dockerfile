FROM ruby:2.6.3
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
    sox \ 
    vim \ 
    libsox-fmt-mp3 \ 
    libpq-dev \        
    nodejs 

RUN mkdir /my_song
WORKDIR /my_song

ADD ./Gemfile /my_song/Gemfile
ADD ./Gemfile.lock /my_song/Gemfile.lock

RUN bundle install
ADD . /my_song

RUN mkdir -p tmp/sockets

RUN apt-get update && apt-get install -y \
  wget \
  xz-utils

RUN wget https://www.ffmpeg.org/releases/ffmpeg-4.2.2.tar.xz \
  && tar Jxvf ./ffmpeg-4.2.2.tar.xz \
  && cp ./ffmpeg*64bit-static/ffmpeg /usr/local/bin/

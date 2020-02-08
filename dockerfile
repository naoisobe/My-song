FROM ruby:2.6.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
    sox \ 
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

RUN mkdir -p /tmp/public && \
  cp -rf /my_song/public/* /tmp/public

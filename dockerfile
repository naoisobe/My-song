FROM ruby:2.6.3
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
    sox \ 
    libsox-fmt-mp3 \ 
    libpq-dev \        
    nodejs  
RUN mkdir /myapp

ENV APP_ROOT /myapp
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT

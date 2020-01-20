FROM nginx:1.15.8

RUN rm -f /etc/nginx/conf.d/*
# Nginxの設定ファイルをコンテナにコピー
ADD nginx.conf /etc/nginx/conf.d/my_song.conf
#Nginx起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf


#!/bin/bash

cd /root;

mkdir /HLS;

mkdir /HLS/video;

sudo apt-get install wget unzip software-properties-common dpkg-dev git make gcc automake build-essential zlib1g-dev libpcre3 libpcre3-dev libssl-dev libxslt1-dev libxml2-dev libgd-dev libgeoip-dev libgoogle-perftools-dev libperl-dev pkg-config autotools-dev gpac ffmpeg mediainfo mencoder lame libvorbisenc2 libvorbisfile3 libx264-dev libvo-aacenc-dev libmp3lame-dev libopus-dev unzip;

wget http://nginx.org/download/nginx-1.15.7.tar.gz;

wget https://github.com/arut/nginx-rtmp-module/archive/master.zip;

sudo apt-get install unzip;

tar -zxvf nginx-1.15.7.tar.gz;

unzip master.zip;

cd nginx-1.15.7;

./configure --with-http_secure_link_module --with-http_ssl_module --with-http_stub_status_module --add-module=../nginx-rtmp-module-master;

make;

sudo make install;

sudo rm /usr/local/nginx/conf/nginx.conf;

sudo wget -P /usr/local/nginx/conf https://raw.githubusercontent.com/joanparcki/joanparcki/main/nginx.conf;

sudo wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx;

sudo chmod +x /etc/init.d/nginx;

sudo update-rc.d nginx defaults;

sudo service nginx start

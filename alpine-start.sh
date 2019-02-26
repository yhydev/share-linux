#!/bin/sh

#sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

apk update && apk add docker ttyd nginx python3 curl
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
pip install flask
mkdir /run/nginx/ && touch /run/nginx/nginx.pid 
cd `dirname $0`
cp default.conf /etc/nginx/conf.d/default.conf
nginx
python3 app.py

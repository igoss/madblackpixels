#!/usr/bin/env bash

env_dir="./environment"



####### Parse environment attributes #######
while IFS="=" read lhs rhs
do
    if [[ ! $lhs =~ ^\ *# && -n $lhs ]]; then
        rhs="${rhs%%\#*}"
        rhs="${rhs%%*( )}"
        rhs="${rhs%\"*}"
        rhs="${rhs#\"*}"
        export $lhs=$rhs
    fi
done < $env_dir



####### Create nginx.conf #######
rm -rf ./nginx/nginx.conf && cp ./nginx/nginx_template.conf ./nginx/nginx.conf

sed -i -e "s/NGINX_PORT/$NGINX_PORT/"           ./nginx/nginx.conf
sed -i -e "s/BACKEND_PORT/$BACKEND_PORT/"       ./nginx/nginx.conf
sed -i -e "s/ALLOW_DOMAIN/$ALLOW_DOMAIN/"       ./nginx/nginx.conf

rm -rf ./nginx/nginx.conf-e



####### Run docker-compose #######
docker-compose up

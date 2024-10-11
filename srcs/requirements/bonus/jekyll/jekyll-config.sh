#!/bin/bash
# We are going to run the quickstart
#https://jekyllrb.com/docs/

if  ! [ -d "/var/www/html/hello_world" ];
then
	echo "Creating a new jekyll blog";
	make -p /var/www/html/hello_world
	jekyll new /var/www/html/hello_world
fi

echo "Jekyll blog has been created!";

cd /var/www/html/hello_world
bundle install
bundle exec jekyll serve --host 0.0.0.0 --port $JEKYLL_PORT

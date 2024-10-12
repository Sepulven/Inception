#!/bin/bash

# Directory in which we will have the start-upper folder

if ! [ -f "/home/start_upper/package.json" ];
then

	mkdir -p /home/start_upper
	# $TOKEN -> is the enviroment variable used to access all of my private repositories,
	# it is from where we are going to clone the website
	git clone "https://$GITHUB_TOKEN@github.com/sepulven/start-upper-pages_deprecated" "/home/start_upper"


	## Port 8080 will be used by nginx.
	sed -i "s/8080/3000/g" /home/start_upper/app.js

	npm install
	npm install --save-dev nodemon
else
	echo "Start-Upper is already installed"
fi


cd /home/start_upper

# Install all of the dependencies in the packake.json file.
npm install

# Builds all of the tailwind dependencies.
npx tailwindcss -i statics/input.css -o statics/styles/style.css

npm run start # Runs nodemon in the foreground.

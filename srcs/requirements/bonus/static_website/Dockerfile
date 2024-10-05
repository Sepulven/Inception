FROM debian:bullseye

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y curl vim


#Install git to clone from the remote private repository of mine.
RUN apt-get install -y git



# curl -SL "https://deb.nodesource.com/setup_20.x" -> This command, solely, will output a script that must 
#be executed from a super user.
#sudo can't deal with pipes, so we use the '-' to expand the stdin to text and replace it in sudo.
# the script will then configure nodejs enviroment.

# -L: Follows any redirects that the URL might have.
# -E: Preserves the user's environment variables when running the command with sudo.
RUN curl -SL "https://deb.nodesource.com/setup_20.x" | bash -

RUN apt-get install -y nodejs

COPY ./node-config.sh /home/

RUN chmod +x /home/node-config.sh

ENTRYPOINT ["/home/node-config.sh"]
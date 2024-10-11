# Jekyll installation link:
# https://jekyllrb.com/docs/installation/ubuntu/

FROM debian:bullseye

RUN apt-get upgrade -y
RUN apt-get update -y

RUN apt-get install -y curl vim

RUN apt-get install -y ruby-full build-essential zlib1g-dev



RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
RUN echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
RUN echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc


#RUN source ~/.bashrc
RUN . ~/.bashrc

# install Jekyll and Bundler:
RUN gem install jekyll bundler


COPY ./jekyll-config.sh /home/jekyll-config.sh
RUN chmod +x /home/jekyll-config.sh


ENTRYPOINT [ "/home/jekyll-config.sh" ]
#https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/install-redis-on-linux/
# For this one I will straight up following the guide in the redis documentation.

## NOTE: Once configured, WordPress will automatically use Redis for caching.

FROM debian:bullseye

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y vim


# Following the step by step of documentation
## Add the repository to the APT index, update it, and install Redis:
RUN apt-get install  -y lsb-release curl gpg
RUN curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
RUN chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" |  tee /etc/apt/sources.list.d/redis.list
RUN apt-get update
RUN apt-get install -y redis


COPY ./redis-config.sh /home/redis-config.sh
RUN chmod +x /home/redis-config.sh

ENTRYPOINT ["/home/redis-config.sh"]
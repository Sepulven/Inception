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


# WARNING Memory overcommit must be enabled! Without it, a background save or replication may fail under 
#low memory condition. Being disabled, it can also cause failures without
#low memory condition, see https://github.com/jemalloc/jemalloc/issues/1328.
# To fix this issue add 'vm.overcommit_memory = 1' 
#to /etc/sysctl.conf and then reboot or run the command 
#'sysctl vm.overcommit_memory=1' for this to take effect.


#Package for kernel management
#RUN apt-get install -y procps

# Enable memory overcommit as specified by the prompt
#RUN echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf

#sysctl: Used to examine and modify kernel parameters at runtime,
# which is relevant for enabling memory overcommit as mentioned in your previous message.
#RUN sysctl -p

COPY ./redis-config.sh /home/redis-config.sh
RUN chmod +x /home/redis-config.sh



# Expose the port 6379 to the Inception network
EXPOSE 6379

ENTRYPOINT ["/home/redis-config.sh"]
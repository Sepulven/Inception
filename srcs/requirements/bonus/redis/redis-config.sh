#!/bin/bash




# WARNING Memory overcommit must be enabled! Without it, a background save
# or replication may fail under low memory condition. Being disabled, it can 
#also cause failures without low memory condition, see https://github.com/jemalloc/jemalloc/issues/1328. 
#To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot 
#or run the command 'sysctl vm.overcommit_memory=1' for this to take effect
# Link to this flag documentation: https://redis.io/docs/latest/operate/oss_and_stack/management/persistence/#aof-advantages
# --appendonly yes -> AOF (Append Only File): AOF persistence logs every write operation received by the server. These operations can then be replayed again at server startup, reconstructing the original dataset. Commands are logged using the same format as the Redis protocol itself.

# Link to the protected mode: https://redis.io/docs/latest/operate/oss_and_stack/management/security/#protected-mode
# As we are working in a internal network and in developing enviroment we can turn the protected-mode off.
redis-server --port 6379 --appendonly yes --protected-mode no
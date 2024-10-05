#!/bin/bash

# Link to this flag documentation: https://redis.io/docs/latest/operate/oss_and_stack/management/persistence/#aof-advantages
# --appendonly yes -> AOF (Append Only File): AOF persistence logs every write operation received by the server. These operations can then be replayed again at server startup, reconstructing the original dataset. Commands are logged using the same format as the Redis protocol itself.

# Link to the protected mode: https://redis.io/docs/latest/operate/oss_and_stack/management/security/#protected-mode
# As we are working in a internal network and in developing enviroment we can turn the protected-mode off.
redis-server --port 6379 --appendonly yes --protected-mode no
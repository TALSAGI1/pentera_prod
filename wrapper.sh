#!/bin/bash

# Start SSH server
service ssh start

# Start nginx
service nginx start

# Keep the container alive (tail keeps process in foreground)
tail -f /dev/null

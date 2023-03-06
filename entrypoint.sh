#!/usr/bin/env sh
#
# get user- / group ids from environment variables 
# or default if variable is not set.
PUID=${PUID:-$(id -u lighttpd)}
PGID=${PGID:-$(id -g lighttpd)}

# modify group- and user id
groupmod -o -g "$PGID" lighttpd
usermod -o -u "$PUID" lighttpd

printf "User dockrun is running with the following IDs:\n"
printf "\tUID: %s\n" "${PUID}"
printf "\tGID: %s\n" "${PGID}"

# Run the command the entrypoint was called with as the custom user.
exec "$@" 


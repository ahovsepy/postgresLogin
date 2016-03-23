#!/bin/bash
###############################################################################
# # Postgres login script 

# This script logs in to correponding postgres db  
# machines running Fedora/RHEL 6.x



# Usage:
#    ./postgresLogin.sh [host] [port] [db] [user] [password] [duration]
###############################################################################

#Start the script
###############################################################################
USAGE="Usage: `basename $0` [host] [port] [db] [user] [password] [duration]"

   # Print usage
if [ "$1" == "-h" ] || [ "$1" == "-help" ]; then
  echo $USAGE
  exit 0
fi



# Check if there are two arguments
if [ $# -ne 6 ]; then
   
echo "Error: the number of input arguments is incorrect!"
echo $USAGE
exit 1
fi

host="$1"
port="$2"
db="$3"
user="$4"
pass="$5"
duration="$6"

echo "$host:$port:$db:$user:$pass" > ~/.pgpass
chmod 0600 ~/.pgpass

end=$((SECONDS+$duration))

while [ $SECONDS -lt $end ]; do
     psql -h $host -p $port  -d $db -U $user
done


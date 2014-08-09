#Randomly generates an ip address and enable it

#!/bin/bash
echo 'Generating random ip address...'
ifconfig en0 down
ifconfig en0 192.168.1.$(($RANDOM %254)) up

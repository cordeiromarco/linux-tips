You could simply echo (with elevated privileges, of course) directly to the /etc/sudoers file:

sudo -i
echo 'nickw444  ALL=(ALL:ALL) ALL' >> /etc/sudoers
#             ^^
#             tab
(note the tab character between the username and the first ALL)

Or, for a script:

#!/bin/bash
# Run me with superuser privileges
echo 'nickw444  ALL=(ALL:ALL) ALL' >> /etc/sudoers
Then save to somefile.sh, chmod a+rx it, and run sudo ./somefile.sh from a terminal window.

To add multiple users, change the script to this;

#!/bin/bash

while [[ -n $1 ]]; do
    echo "$1    ALL=(ALL:ALL) ALL" >> /etc/sudoers;
    shift # shift all parameters;
done
Then, run the script like this (assuming you saved it as addsudousers.sh):

sudo ./addsudousers.sh bob joe jeff
that is, space-separated.

To read the names from a file:

nickw444@laptop ~ $ sudo ./addsudousers.sh `cat listofusers.txt`
listofusers.txt should also be space-separated.

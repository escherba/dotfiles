Misc
====

Set up access to a local server
-------------------------------

To find out IP address:

   dscacheutil -q host -a name <hostname>.local

To connect without having to type password every time:

    brew install ssh-copy-id
    ssh-copy-id -i ~/.ssh/id_rsa <user-name>@<hostname>.local

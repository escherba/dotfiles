File transfer
-------------

rsync -rave "ssh -i PEMKEYFILE.pem" /path/to/local/files/* ec2-user@EC2_INSTANCE_HOSTNAME:/path/to/remote/files


Set up for using AWS instances as remote workstations
-----------------------------------------------------

On Amazon AMI instances:

.. code-block:: bash

    # update
    sudo yum -y update
    sudo yum -y upgrade

On Ubuntu instances:

.. code-block:: bash

    # update
    sudo apt update
    sudo apt upgrade

and then

.. code-block:: bash

    # enable EPEL6 by changing enabled=0 -> enabled=1
    sudo vim /etc/yum.repos.d/epel.repo

    # install misc. utilities
    sudo yum install htop tmux mosh

    # configure Tmux
    curl https://raw.githubusercontent.com/escherba/dotfiles/master/home/.tmux-linux.conf -o ~/.tmux.conf

Add to `.bashrc`::

    alias ssh-emr="ssh -i $AWS_KEY $EMR_HOST"
    alias mosh-emr="mosh --ssh=\"ssh -Y -i $AWS_KEY\" $EMR_HOST --server=\"/usr/bin/mosh-server\" -- tmux new-session -A -s main"
    alias mosh-emr-bind="mosh --ssh=\"ssh -i $AWS_KEY -ND 8157\" $EMR_HOST --server=\"/usr/bin/mosh-server\""



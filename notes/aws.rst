Jupyter Lab Workflow
--------------------

Install bare necessities::

    sudo yum install htop tmux git
    curl https://raw.githubusercontent.com/escherba/dotfiles/master/home/.tmux-linux.conf -o ~/.tmux.conf

The rest of the commands are run in a tmux window::

    wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
    bash Anaconda3-2019.07-Linux-x86_64.sh
    conda clean --all
    
Given a repo with `environment.yml` file in it::

    conda env create --name env1 -f environment.yml
    conda clean --all
    conda activate env1
    
For analysis::

    conda install matplotlib jupyterlab
    jupyter lab --no-browser --port 8888
    
On the local machine, add the following to `~/.ssh/config` (it allows you to log in to your
instance simply by typing `ssh ec2-large`)::

    Host ec2-large
        <your public ec2 ip address>
        User ec2-user
        IdentityFile ~/.ssh/aws_web_east.pem

Then run port forwarding like this::

    ssh -NfL 9999:localhost:8888 ec2-large
    
Now you can open the browser at http://localhost:9999 and use Jupyter Lab. These steps roughly follow ones outlined in `Alex Sanchez post`_.

File transfer
-------------

To quickly download lots of files from AWS EC2 instance::

    rsync -rave "ssh -i ~/.ssh/aws_web_east.pem" ec2-user@EC2_INSTANCE_HOSTNAME:/path/to/remote/files .


Using AWS with Mosh
-------------------

Mosh is an alternative to SSH that runs over UDP and has some advantages over unreliable networks. You can read more about it in `this article`_.


First we upgrade the instance (on Ubuntu the same is accomplished via ``sudo apt update && sudo apt ugrade``):

.. code-block:: bash

    sudo yum -y update
    sudo yum -y upgrade

Then enable EPEL6 by changing ``enabled=0`` to ``enabled=1`` in ``/etc/yum.repos.d/epel.repo`` and install Mosh:

.. code-block:: bash

    sudo yum install mosh

While we're at it, configure tmux:

.. code-block:: bash

    # configure Tmux
    curl https://raw.githubusercontent.com/escherba/dotfiles/master/home/.tmux-linux.conf -o ~/.tmux.conf

Finally, add to ``.bashrc`` on your local machine::

    alias ssh-ec2-large="ssh -i $AWS_PEM_FILE $AWS_HOST"
    alias mosh-ec2-large="mosh --ssh=\"ssh -Y -i $AWS_PEM_FILE\" $AWS_HOST --server=\"/usr/bin/mosh-server\" -- tmux new-session -A -s main"
    alias mosh-ec2-large-bind="mosh --ssh=\"ssh -i $AWS_PEM_FILE -ND 8157\" $AWS_HOST --server=\"/usr/bin/mosh-server\""

.. _Alex Sanchez post: https://medium.com/@alexjsanchez/python-3-notebooks-on-aws-ec2-in-15-mostly-easy-steps-2ec5e662c6c6
.. _this article: http://linuxpitstop.com/ssh-vs-mosh/

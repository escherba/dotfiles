dotfiles
========

A collection of config files for development on Mac OS X and Linux

Quick Linux Setup for AWS
-------------------------

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


Linux environment (Ubuntu)
--------------------------

First set up basic development environment::

    sudo apt update
    sudo apt upgrade
    sudo apt dist-upgrade
    reboot

    sudo apt install gcc make dkms build-essential linux-headers-$(uname -r)
    sudo apt install xorg-dev xserver-xorg-dev freeglut3-dev
    sudo dpkg-reconfigure xserver-xorg

Download the appropriate `NVIDIA driver <http://www.nvidia.com/Download/index.aspx>`_ and compile it in safe-recovery mode. After compiling, execute the following command::

    sudo update-initramfs -u

Reboot to load the driver.  Then install CUDA from https://developer.nvidia.com/cuda-toolkit (it's easiest to download the .deb file and install it with ``sudo dpkg -i``. For CUDA v8.0 the following lines to ``.bashrc``::

    export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

Install GUI with::

    sudo apt install ubuntu-desktop
    sudo apt install software-center unity-tweak-tool indicator-multiload synaptic terminator

(Optional) Disable the default graphics drivers. The following SO answer gives detailed instructions on how to disable the default driver: http://askubuntu.com/a/508255 .

Before installing Vim, it might be a good idea to remove existing installation(s) of this editor. Run ``dpkg --get-selections | grep vim`` and uninstall any packages present. Then::

    sudo apt install vim-gnome-py2

Since ``vim-gnome-py2`` seems to include base ``vim-gnome`` package that is built with Python3 support, use ``update-alternatives`` tool to set the specific verison to be used::

    sudo update-alternatives --config vi

Finally install some useful packages::

   sudo apt install htop tmux mosh
   sudo apt install git clang cmake exuberant-ctags
   sudo apt install graphviz graphviz-dev r-base
   sudo apt install msttcorefonts
   sudo apt install silversearcher-ag
   sudo apt install python-pip python-virtualenv cython
   sudo apt install python-scipy python-pandas python-igraph \
       python-opencv python-matplotlib python-sklearn

To support OpenMP compilation with clang::

    sudo apt install libiomp-dev
 
If you installed Ubuntu Server, you may have services running (such as Apache2 and MySQL) that you don't actually want. Ensure their startup on boot is manual by::

    echo manual | sudo tee /etc/init/apache2.override
    echo manual | sudo tee /etc/init/mysql.override

For bookkeeping, to generate a list of user-installed packages, use::

    comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

If you edit `~/.Xdefaults`, source the changes with::

    xrdb -merge ~/.Xdefaults

Docker is best installed with the help of this script: https://gist.github.com/escherba/1ffcf8ff9e0791f8206b737322f6e3bc

Installing a recent version of R
--------------------------------

Add the following entry to file `/etc/apt/sources.list`:

    deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/

Run command:

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

Finally:

    sudo apt update
    sudo apt install r-base r-base-dev

If you updated R from the previous version, installed packages will become incompatible.
To update them:

    update.packages(ask=FALSE, checkBuilt = TRUE)

For more info, see: https://cran.r-project.org/bin/linux/ubuntu/

Misc
-----

OpenCL library::

    sudo apt install ocl-icd-opencl-dev

Haskell
~~~~~~~

Whether or not you program in Haskell, pandoc is a must-have.

.. code-block:: bash

    #brew install ghc cabal-install
    cabal install pandoc
    cabal install hoogle
    cabal install ghc-mod
    cabal install hdevtools
    cabal install hlint
    cabal install pointfree

Python environment
~~~~~~~~~~~~~~~~~~

Linting support for python:

.. code-block:: bash

    pip install -U pip
    pip install pyenchant
    pip install ipdb pylint flake8

Machine learning

.. code-block:: bash

    pip install funcy pandas tqdm palettable
    pip install scikit-learn
    pip install jupyter


Git
~~~

Jupyter/IPython notebooks require a filter to work well with version control. After `this post <http://stackoverflow.com/a/20844506/597371>`_, here are instructions how to set up the filter:

1. Make sure `nbformat` is installed:

.. code-block:: bash

    pip install nbformat

2. Run these commands:

.. code-block:: bash

    git config --global core.attributesfile ~/.gitattributes
    git config --global filter.dropoutput_ipynb.clean ~/.local/bin/ipynb_output_filter.py
    git config --global filter.dropoutput_ipynb.smudge cat



dotfiles
========

A collection of config files for development on Mac OS X and Linux

NVIDIA stuff
------------

If you want just the drivers::

    sudo -E add-apt-repository ppa:graphics-drivers/ppa
    sudo apt update
    ubuntu-drivers devices | grep nvidia

Now install the driver marked as "recommended", for example::

    sudo apt install nvidia-418

Then reboot to load the driver.


To install CUDA, download an appropriate .deb file from
https://developer.nvidia.com/cuda-toolkit. Then::

    sudo dpkg -i cuda-repo-ubuntu1604-10-1-local-10.1.168-418.67_1.0-1_amd64.deb
    sudo apt-key add /var/cuda-repo-10-1-local-10.1.168-418.67/7fa2af80.pub
    sudo apt-get update
    sudo apt-get install cuda

Then make sure you have the following in your `.bashrc` (and that
the appropriate symlinks exist)::

    export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}


The Rest of the Installation
----------------------------

Before installing Vim, it might be a good idea to remove existing
installation(s) of this editor. Run ``dpkg --get-selections | grep vim`` and
uninstall any packages present. Then::

    sudo apt install vim-gtk

To select the specific version of Vim as default::

    sudo update-alternatives --config vi

Finally install some useful packages::

   sudo apt install htop tmux mosh
   sudo apt install git clang cmake exuberant-ctags silversearcher-ag
   sudo apt install graphviz graphviz-dev r-base msttcorefonts

To support OpenMP compilation with clang::

    sudo apt install libiomp-dev

If you installed Ubuntu Server, you may have services running (such as Apache2
and MySQL) that you don't actually want. Ensure their startup on boot is manual
by::

    echo manual | sudo tee /etc/init/apache2.override
    echo manual | sudo tee /etc/init/mysql.override

For bookkeeping, to generate a list of user-installed packages, use::

    comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

If you edit `~/.Xdefaults`, source the changes with::

    xrdb -merge ~/.Xdefaults

Docker is best installed with the help of this script: https://gist.github.com/escherba/1ffcf8ff9e0791f8206b737322f6e3bc

Installing a recent version of R
--------------------------------

Anaconda set up is probably recommended over this...

Add the following entry to file `/etc/apt/sources.list`::

    deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/

Run command::

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

Finally::

    sudo apt update
    sudo apt install r-base r-base-dev

If you updated R from the previous version, installed packages will become incompatible.
To update them::

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

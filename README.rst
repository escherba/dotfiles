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
    sudo apt-get update
    sudo apt-get upgrade

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

    sudo apt-get update
    sudo apt-get upgrade

    sudo apt-get install gcc make build-essential linux-headers-$(uname -r)
    sudo apt-get install xorg-dev xserver-xorg xserver-xorg-dev freeglut3-dev
    sudo dpkg-reconfigure xserver-xorg

Download the appropriate `NVIDIA driver <http://www.nvidia.com/Download/index.aspx>`_ and compile it. After compiling, execute the following command::

    sudo update-initramfs -u

Reboot to load the driver.  Then install CUDA from https://developer.nvidia.com/cuda-toolkit (it's easiest to download the .deb file and install it with ``sudo dpkg -i``. For CUDA v8.0 the following lines to ``.bashrc``::

    export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

Install GUI with::

    sudo apt-get install openbox
    sudo apt-get install ubuntu-desktop
    sudo apt-get install software-center unity-tweak-tool indicator-multiload

(Optional) Disable the default graphics drivers. The following SO answer gives detailed instructions on how to disable the default driver: http://askubuntu.com/a/508255 .

Before installing Vim, it might be a good idea to remove existing installation(s) of this editor. Run ``dpkg --get-selections | grep vim`` and uninstall any packages present. Then::

    sudo apt-get install vim-gnome-py2

Since ``vim-gnome-py2`` seems to include base ``vim-gnome`` package that is built with Python3 support, use ``update-alternatives`` tool to set the specific verison to be used::

    sudo update-alternatives --config vi

Finally install some useful packages::

   sudo apt-get install htop tmux mosh
   sudo apt-get install git clang cmake
   sudo apt-get install graphviz graphviz-dev r-base
   sudo apt-get install silversearcher-ag
   sudo apt-get install python-pip python-virtualenv python-cython
   sudo apt-get install python-scipy python-pandas python-igraph \
       python-pygraphviz python-opencv python-matplotlib python-sklearn

To support OpenMP compilation with clang::

    sudo apt-get install libiomp-dev
 
If you installed Ubuntu Server, you may have services running (such as Apache2 and MySQL) that you don't actually want. Ensure their startup on boot is manual by::

    echo manual | sudo tee /etc/init/apache2.override
    echo manual | sudo tee /etc/init/mysql.override

For bookkeeping, to generate a list of user-installed packages, use::

    comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

If you edit `~/.Xdefaults`, source the changes with::

    xrdb -merge ~/.Xdefaults

Docker is best installed with the help of this script: https://gist.github.com/escherba/1ffcf8ff9e0791f8206b737322f6e3bc

Mac OS X environment
--------------------

It turns out it is quite involved to make a Mac OS X system usable as a
development machine. But never fear, it can be as fast as a few hours =)
if you follow the instructions below.

Basics
~~~~~~

First, install Xcode from the App Store. Then, install the
command-line development tools as follows: in the terminal,

::

    xcode-select --install
    sudo xcode-select -s /Library/Developer/CommandLineTools

Then Homebrew package manager:

.. code-block:: bash

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

To avoid the nagging "GitHub 401 Unauthorized" error that occasionally
shows up when using brew, set up Github access token. Go to Github's
`Personal Access Tokens <http://github.com/settings/tokens>`__ page and
create a new token named ``HOMEBREW_GITHUB_API_TOKEN``. Uncheck every
scope box when creating this token. After receiving the token on the
next page, copy it to system clipboard and have it sourced into your
environment on shell startup. Don't place it into your ``.bash_profile``
if you plan on sharing this file online, instead edit ``~/.profile``,
enter the ``export HOMEBREW_GITHUB_API_TOKEN=<token_text>`` line in
there, and make sure to source the file from ``~/.bash_profile``.

To setup a development environment with GCC,

.. code-block:: bash

    brew install gcc
    brew install coreutils
    brew install gnu-sed
    brew install ctags-exuberant
    brew install enchant
    brew install pstree htop wget
    brew install cmake
    brew install valgrind
    brew install tmux mosh awscli s3cmd
    brew install jq fondu
    brew install gts Caskroom/cask/xquartz
    brew install graphviz --with-gts
    brew install reattach-to-user-namespace

Other dependencies:

.. code-block:: bash

    brew install git gpg
    brew install czmq zmq

Java
~~~~

Download and install an SDK from `Oracle site <http://www.oracle.com/technetwork/java/javase/downloads/index.html>`_. Some exotic packages (Octave) require Java 6 which can be had from `Apple site <https://support.apple.com/kb/DL1572>`_. Install latest Eclipse. Follow instructions from `Getting Started <http://scala-ide.org/docs/user/gettingstarted.html>`_ page for Scala IDE to configure Eclipse to work with Scala projects. Install `eclim` following the instructions on `this page <http://eclim.org/install.html>`_. Then,


.. code-block:: bash

    brew install sbt maven gradle
    brew install scala
    brew install apache-spark


Scientific packages
~~~~~~~~~~~~~~~~~~~

HDF5 is needed for Pandas (and even if you don't use Pandas, you should
check out HDF5).

.. code-block:: bash

    brew install python --framework
    brew install pyenv
    brew install pyenv-virtualenv

    brew install pygraphviz

    brew install homebrew/science/hdf5
    brew install homebrew/science/octave
    brew install homebrew/science/r
    brew install homebrew/science/opencv

    brew install homebrew/python/numpy
    brew install homebrew/python/scipy

    brew install homebrew/science/igraph
    brew install homebrew/science/graph-tool

Haskell
~~~~~~~

Whether or not you program in Haskell, pandoc is a must-have.

.. code-block:: bash

    brew install ghc cabal-install
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
    git config --global filter.dropoutput_ipynb.clean ~/bin/ipynb_output_filter.py
    git config --global filter.dropoutput_ipynb.smudge cat

Vim
~~~

If you develop with Vim,

.. code-block:: bash

    brew install macvim --with-python --with-override-system-vim

Install Vim-Plug plug-in manager for Vim

.. code-block:: bash

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Then copy the included ``.vimrc`` into your home directory, open Vim and
execute `:PlugInstall`.
The YouCompleteMe plugin should be set up automatically via a post-install hook,
but if it isn't,

.. code-block:: bash

    cd ~/.vim/bundle/YouCompleteMe
    git submodule update --init --recursive
    python install.py --clang-completer

For more information on YouCompleteMe installation specifics, see `this README section <https://github.com/Valloric/YouCompleteMe#mac-os-x>`__.

Emacs
~~~~~

If you develop with Emacs, well, too bad :(

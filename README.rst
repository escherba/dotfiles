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


Linux environemnt (Ubuntu)
--------------------------

If the graphics card you're using is too new to be supported by the bundled drivers, follow instructions in this post to bypass and disable the default driver through safe mode: http://askubuntu.com/a/508255

::

    sudo apt-get install xorg xorg-dev xserver-xorg xserver-xorg-core xserver-xorg-dev
    sudo dpkg-reconfigure xserver-xorg
    sudo apt-get install freeglut3-dev mesa-common-dev

    sudo add-apt-repository ppa:graphics-drivers/ppa
    sudo apt-get update
    sudo apt-get install nvidia-367

Reboot to load drivers.  Then you can install CUDA (https://developer.nvidia.com/cuda-toolkit) and GUI:

::

    sudo apt-get install openbox
    sudo apt-get instlal ubuntu-desktop

Also add the following lines to ``.bashrc``:

::

    export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

Finally install some useful packages:

::

   sudo apt-get install htop tmux mosh
   sudo apt-get install git
   sudo apt-get install graphviz graphviz-dev
   sudo apt-get install python-pip python-virtualenv
   sudo apt-get install python-scipy
   sudo apt-get install python-pandas
   sudo apt-get install python-igraph
   sudo apt-get install python-pygraphviz
   sudo apt-get install python-opencv
   sudo apt-get install r-base
   sudo apt-get install clang
   sudo apt-get install cmake
   sudo apt-get install vim-nox-py2
   sudo apt-get install python-matplotlib
   sudo apt-get install python-sklearn

If you installed Ubuntu Server, you may have services running (such as Apache2 and MySQL) that you don't actually want. Ensure their startup on boot is manual by
::

    echo manual | sudo tee /etc/init/apache2.override
    echo manual | sudo tee /etc/init/mysql.override

For bookkeeping, to generate a list of user-installed packages, use::

    comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)


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

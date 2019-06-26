dotfiles
========

A collection of config files for development on Mac OS X and Linux

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

To setup a development environment,

.. code-block:: bash

    brew update
    brew upgrade
    
    brew install gcc
    brew install coreutils
    brew install gnu-sed
    brew install ctags-exuberant
    brew install enchant
    brew install pstree htop wget
    brew install cmake
    brew install valgrind
    brew install tmux mosh awscli s3cmd
    brew install jq
    brew install fondu
    brew install gts Caskroom/cask/xquartz
    brew install graphviz --with-gts
    brew install reattach-to-user-namespace
    brew install gnuplot --with-qt
    brew install r --with-openblas
    brew install git gpg
    brew install czmq zmq

You may also need:

.. code-block:: bash

    brew install llvm
    brew install libomp

Java
~~~~

Download and install an SDK from `Oracle site <http://www.oracle.com/technetwork/java/javase/downloads/index.html>`_.
Some exotic packages (Octave) require Java 6 which can be had from `Apple site <https://support.apple.com/kb/DL1572>`_.
Install latest Eclipse. Follow instructions from `Getting Started <http://scala-ide.org/docs/user/gettingstarted.html>`_
page for Scala IDE to configure Eclipse to work with Scala projects. Install `eclim` following the instructions on
`this page <http://eclim.org/install.html>`_. Then,


.. code-block:: bash

    brew install sbt maven gradle
    brew install scala
    brew install apache-spark


Scientific packages
~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    brew install python --framework

    brew install pygraphviz

    brew install homebrew/science/hdf5
    brew install homebrew/science/octave
    #brew install homebrew/science/r
    brew install homebrew/science/opencv

    brew install homebrew/python/numpy
    brew install homebrew/python/scipy

    brew install homebrew/science/igraph
    brew install homebrew/science/graph-tool


Haskell
~~~~~~~

.. code-block:: bash

    brew install ghc cabal-install
    cabal install pandoc
    cabal install hoogle
    cabal install ghc-mod
    cabal install hdevtools
    cabal install hlint
    cabal install pointfree

LaTeX
~~~~~

I found the following useful: https://ryan-holben.github.io/tex/latex/installation/macos/2016/08/21/installing-tex-on-mac/ When done, install these:

.. code-block:: bash

   sudo tlmgr install adjustbox
   sudo tlmgr install collectbox
   sudo tlmgr install ucs
   sudo tlmgr install enumitem
   sudo tlmgr install tcolorbox
   sudo tlmgr install environ
   sudo tlmgr install trimspaces
   sudo tlmgr install collection-fontsrecommended

Python environment
~~~~~~~~~~~~~~~~~~

Linting support for python:

.. code-block:: bash

    pip install -U pip
    pip install ipdb pylint flake8 pyenchant

For machine learning packages, I recommend using Anaconda.

Vim
~~~

If you develop with Vim,

.. code-block:: bash

    brew install macvim

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

For more information on YouCompleteMe installation specifics, see
`this README section <https://github.com/Valloric/YouCompleteMe#mac-os-x>`_.
